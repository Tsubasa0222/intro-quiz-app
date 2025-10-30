//
//  ContentView.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2025/10/31.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel() //データを所有（親）
    
    var body: some View {
        switch viewModel.state {
        case .home:
            HomeView(viewModel: viewModel)
        case .quiz:
            QuizView(viewModel: viewModel)
        case .correct:
            CorrectView(viewModel: viewModel)
        case .incorrect:
            InCorrectView(viewModel: viewModel)
        case .score:
            ScoreView(viewModel: viewModel)
        }
    }
}
