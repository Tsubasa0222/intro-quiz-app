//
//  ContentView.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2024/05/10.
//

import SwiftUI

struct ContentView: View {
    @State var isSecondView = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("イントロクイズ")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Button("開始する") {
                isSecondView = true
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .sheet(isPresented: $isSecondView) {
                SecondView()
                    .presentationDetents([.large])
            }
            Spacer()
            
        }
        
    }
}

#Preview {
    ContentView()
}
