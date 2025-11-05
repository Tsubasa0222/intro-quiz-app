//
//  before.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2025/10/31.
//
/*
import SwiftUI
import AVFoundation

struct aView: View {
    @Environment(\.dismiss) var dismiss
    @State var AudioPlayer: AVAudioPlayer?
    @State var MusicName = ["夜に駆ける", "群青", "アイドル", "祝福", "怪物", "Dynamite", "Butter", "Permission to Dance", "DNA", "Boy With Luv", "廻廻奇譚", "ドラマツルギー", "ナンセンス文学", "lazy cat", "ファイトソング", "春を告げる", "色彩", "ハルジオン", "Sugar Rush Ride", "SSS(Sending Secret Signals)"]
    @State var randomoption1 = ""
    @State var randomoption2 = ""
    @State var randomoption3 = ""
    @State var randomoption4 = ""
    @State var CorrectMusic = ""
    @State var PlayedMusic: [String] = []
    @State var timer: Timer?
    @State var isPlaying = false
    @State var ShowAnswer = false
    @State var TotalQuestions = 0
    @State var CorrectAnswer = 0
    @State var SelectedAnswer = ""
    @State var isAnswerCorrect = false
    var resetState: Bool = false
    
    init(TotalQuestions: Int = 0, CorrectAnswer: Int = 0, resetState: Bool = false) {
        self._TotalQuestions = State(initialValue: TotalQuestions)
        self._CorrectAnswer = State(initialValue: CorrectAnswer)
        self.resetState = resetState
        if resetState {
            _CorrectMusic = State(initialValue: "")
            _SelectedAnswer = State(initialValue: "")
        }
    }
    
    func PlayMusic() {
        if !CorrectMusic.isEmpty {
            if let musicURL = Bundle.main.url(forResource: CorrectMusic, withExtension: "mp3") {
                do {
                    AudioPlayer = try AVAudioPlayer(contentsOf: musicURL)
                    AudioPlayer?.prepareToPlay()
                    AudioPlayer?.play()
                } catch {
                    print("Error playing sound: \(error)")
                }
            } else {
                print("指定された曲ファイルが見つかりません: \(CorrectMusic)")
            }
            return
        }
        
        let MusicList = ["ハルジオン", "DNA", "lazy cat", "色彩", "SSS(Sending Secret Signals)"]
        let RemainMusic = MusicList.filter { !PlayedMusic.contains($0) }
        
        guard let RandomMusic = RemainMusic.randomElement(),
              let musicURL = Bundle.main.url(forResource: RandomMusic, withExtension: "mp3") else {
            print("再生可能な曲がありません")
            return
        }
        
        do {
            AudioPlayer = try AVAudioPlayer(contentsOf: musicURL)
            AudioPlayer?.prepareToPlay()
            AudioPlayer?.play()
            CorrectMusic = RandomMusic
            PlayedMusic.append(CorrectMusic)
            SelectOption()
        } catch {
            print("Error playing sound: \(error)")
        }
    }
    
    func SelectOption() {
        MusicName.removeAll { $0 == CorrectMusic }
        MusicName.shuffle()
        let WrongOption = Array(MusicName.prefix(3))
        var AllOption = WrongOption
        let CorrectOption = Int.random(in: 0...3)
        AllOption.insert(CorrectMusic, at: CorrectOption)
        randomoption1 = AllOption[0]
        randomoption2 = AllOption[1]
        randomoption3 = AllOption[2]
        randomoption4 = AllOption[3]
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()  // 前の画面（HomeView）に戻る
                }) {
                    Image(systemName: "chevron.left")
                    Text("ホームに戻る")
                }
                .padding()
            }
            
            Spacer()
            
            Text("曲名を選択してください！")
                .padding()
                .font(.title3)
            
            Button(randomoption1) {
                SelectedAnswer = randomoption1
                TotalQuestions += 1
                isAnswerCorrect = randomoption1 == CorrectMusic  // ここで判定確定
                if isAnswerCorrect {
                    CorrectAnswer += 1
                }
                ShowAnswer = true
                DispatchQueue.global().async {
                    AudioPlayer?.stop()
                }
            }
            .padding()
            
            Button(randomoption2) {
                SelectedAnswer = randomoption2
                TotalQuestions += 1
                isAnswerCorrect = randomoption2 == CorrectMusic  // ここで判定確定
                if isAnswerCorrect {
                    CorrectAnswer += 1
                }
                ShowAnswer = true
                DispatchQueue.global().async {
                    AudioPlayer?.stop()
                }
            }
            .padding()
            
            Button(randomoption3) {
                SelectedAnswer = randomoption3
                TotalQuestions += 1
                isAnswerCorrect = randomoption3 == CorrectMusic  // ここで判定確定
                if isAnswerCorrect {
                    CorrectAnswer += 1
                }
                ShowAnswer = true
                DispatchQueue.global().async {
                    AudioPlayer?.stop()
                }
            }
            .padding()
            
            Button(randomoption4) {
                SelectedAnswer = randomoption4
                TotalQuestions += 1
                isAnswerCorrect = randomoption4 == CorrectMusic  // ここで判定確定
                if isAnswerCorrect {
                    CorrectAnswer += 1
                }
                ShowAnswer = true
                DispatchQueue.global().async {
                    AudioPlayer?.stop()
                }
            }
            .padding()
            
            Button("再生") {
                isPlaying = true
                self.PlayMusic()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    timer?.invalidate()
                    timer = nil
                    isPlaying = false
                }
            }
            .padding()
            .font(.largeTitle)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(isPlaying)
            
            Spacer()
        }
        .fullScreenCover(isPresented: $ShowAnswer) {
            if isAnswerCorrect {
                CorrectView(
                    CorrectAnswer: CorrectAnswer,
                    TotalQuestions: TotalQuestions
                )
                .presentationDetents([.large])
            } else {
                InCorrectView(
                    CorrectAnswer: CorrectAnswer,
                    TotalQuestions: TotalQuestions
                )
                .presentationDetents([.large])
                .padding()
            }
        }
    }
}
#Preview {
    QuizView(TotalQuestions: 0, CorrectAnswer: 0)
}
