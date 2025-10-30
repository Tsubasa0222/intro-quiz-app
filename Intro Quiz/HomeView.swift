//
//  HomeView.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2024/05/10.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: ViewModel //データを使う（子）
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("イントロクイズ")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Button(action: {
                viewModel.startQuiz()
            }) {
                Text("開始する")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
    }
}


