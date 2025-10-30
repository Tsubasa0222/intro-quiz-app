//
//  QuizView.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2024/05/10.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("曲名を選択してください！")
                .font(.title3)
                .padding()
            
            ForEach(viewModel.options) { music in
                //各選択肢に対してボタンを作成
                Button(music.title) {
                    viewModel.chooseAnswer(music)
                    //選択された曲をViewModekに渡して正誤判定
                }
                .padding()
            }
            
            Button("再生") {
                viewModel.playMusic()
            }
            .padding()
            .font(.title2)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
    }
}

