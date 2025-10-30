//
//  CorrectView.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2025/10/28.
//

import SwiftUI

struct CorrectView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "circle")
                .resizable()
                .foregroundColor(.green)
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width / 2)
                .padding()
            
            Text("正解！")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            HStack {
                Button("次へ") {
                    viewModel.nextQuestion()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.title3)
                
                Spacer().frame(width: 75)
                
                Button("終了") {
                    viewModel.state = .score
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.title3)
            }
            
            Spacer()
        }
    }
}

