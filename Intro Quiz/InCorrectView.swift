//
//  InCorrectView.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2024/05/10.
//

import SwiftUI

struct InCorrectView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "xmark")
                .resizable()
                .foregroundColor(.red)
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width / 2)
                .padding()
            
            Text("不正解…")
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

