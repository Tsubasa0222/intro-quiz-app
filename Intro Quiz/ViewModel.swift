//
//  ViewModel.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2025/10/31.
//

import SwiftUI
import AVFoundation //フレームワークをインポート（AVFoundation）

// ViewModelクラス（クイズアプリの状態や処理を管理）
final class ViewModel: ObservableObject {
    
    enum QuizState {
        case home //ホーム画面
        case quiz //クイズ画面
        case correct //正解画面
        case incorrect //不正解画面
        case score //スコア画面
    }
    
    @Published var state: QuizState = .home //初期の画面
    @Published var audioPlayer: AVAudioPlayer?
    //クイズで使用する音楽のリスト
    @Published var allMusic: [Music] = [
        Music(title: "夜に駆ける", filename: "夜に駆ける"),
        Music(title: "群青", filename: "群青"),
        Music(title: "アイドル", filename: "アイドル"),
        Music(title: "祝福", filename: "祝福"),
        Music(title: "怪物", filename: "怪物"),
        Music(title: "Dynamite", filename: "Dynamite"),
        Music(title: "Butter", filename: "Butter"),
        Music(title: "Permission to Dance", filename: "Permission to Dance"),
        Music(title: "DNA", filename: "DNA"),
        Music(title: "Boy With Luv", filename: "Boy With Luv"),
        Music(title: "廻廻奇譚", filename: "廻廻奇譚"),
        Music(title: "ドラマツルギー", filename: "ドラマツルギー"),
        Music(title: "ナンセンス文学", filename: "ナンセンス文学"),
        Music(title: "lazy cat", filename: "lazy cat"),
        Music(title: "ファイトソング", filename: "ファイトソング"),
        Music(title: "doku", filename: "doku"),
        Music(title: "色彩", filename: "色彩"),
        Music(title: "ハルジオン", filename: "ハルジオン"),
        Music(title: "Sugar Rush Ride", filename: "Sugar Rush Ride"),
        Music(title: "SSS(Sending Secret Signals)", filename: "SSS")
    ]
    
    @Published var correctMusic: Music? //正解の曲
    @Published var playedSongs: [Music] = [] //既に出題した曲
    @Published var options: [Music] = [] //選択肢
    
    @Published var totalQuestions = 0 //出題した曲の数
    @Published var correctAnswers = 0 //正解した曲の数
    
    //クイズを開始する処理
    func startQuiz() {
        totalQuestions = 0 //出題数をリセット
        correctAnswers = 0 //正解数をリセット
        playedSongs.removeAll() //出題済みの曲を削除
        nextQuestion() //nextQuestionを呼び出し
    }
    
    //問題を出題する処理
    func nextQuestion() {
        //まだ出題していない曲を抽出
        let remainingMusic = allMusic.filter { !playedSongs.contains($0) }
        //まだ出題していない曲の中からランダムに1曲を取り出す
        guard let music = remainingMusic.randomElement() else {
            state = .score //全曲出題済みならスコア画面に遷移
            return
        }
        correctMusic = music //出題曲を設定
        playedSongs.append(music) //出題済みリストに追加
        selectOptions() //selectOptionsを呼び出し
        state = .quiz //クイズ画面に遷移
    }
    
    //選択肢を作成する処理
    private func selectOptions() {
        guard let correct = correctMusic else { return }
        var wrong = allMusic.filter { $0 != correct } //正解曲以外を抽出
        wrong.shuffle() //シャッフル
        options = (Array(wrong.prefix(3)) + [correct]).shuffled() //３曲と正解曲を混ぜてシャッフル
    }
    
    //音楽を再生する処理
    func playMusic() {
        guard let correct = correctMusic,
              let url = Bundle.main.url(forResource: correct.filename, withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url) //音声ファイルを読み込み
            audioPlayer?.prepareToPlay() //再生準備
            audioPlayer?.play() //再生開始
        } catch {
            print("再生エラー: \(error)") //エラー表示
        }
    }
    
    //回答したときの処理
    func chooseAnswer(_ music: Music) {
        totalQuestions += 1 //出題数を1増やす
        
        //正解か不正解か判定
        if music == correctMusic {
            correctAnswers += 1 //正解数を1増やす
            state = .correct //正解画面に遷移
        } else {
            state = .incorrect //不正解画面に遷移
        }
        audioPlayer?.stop() //音楽を停止
    }
     //ホーム画面に戻る処理
    func goHome() {
        state = .home
    }
}
