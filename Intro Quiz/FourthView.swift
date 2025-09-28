//
//  fourthView.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2024/05/10.
//

import SwiftUI

struct fourthView: View {
    @State var isfifthView = false
    @State var isContentView = false
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "xmark")
                .resizable()
                .foregroundColor(.blue)
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Text("不正解")
                .font(.largeTitle)
            Spacer()
            HStack{
                Button("次へ") {
                    isfifthView = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.title3)
                Spacer().frame(width: 75)
                .sheet(isPresented: $isfifthView) {
                    fifthView()
                        .presentationDetents([.large])
                }
                Button("終了") {
                    isContentView = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.title3)
                .sheet(isPresented: $isContentView) {
                    ContentView()
                        .presentationDetents([.large])
                }
            }
            Spacer()
        }
    }
}

#Preview {
    fourthView()
}
