//
//  ScoreView.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2024/05/10.
//

import SwiftUI

struct ScoreView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("スコア結果")
                .font(.largeTitle)
                .padding()
            
            Text("正解数：\(viewModel.correctAnswers)")
                .font(.title2)
                .padding()
            
            Text("出題数：\(viewModel.totalQuestions)")
                .font(.title2)
                .padding()
            
            Text("正答率：\(viewModel.totalQuestions > 0 ? Int(Double(viewModel.correctAnswers) / Double(viewModel.totalQuestions) * 100) : 0)%")
                .font(.title2)
                .padding()

            Button("ホームへ戻る") {
                viewModel.goHome()
            }
            .font(.title3)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
    }
}

