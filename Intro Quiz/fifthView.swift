//
//  fifthView.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2024/05/10.
//

import SwiftUI
import AVFoundation

struct fifthView: View {
    @State var AudioPlayer:AVAudioPlayer?
    @State var option2 = ["Dynamite", "DNA", "Boy With Luv", "IDOL"]
    @State var randomoption1 = ""
    @State var randomoption2 = ""
    @State var randomoption3 = ""
    @State var randomoption4 = ""
    @State var timer: Timer?
    @State var isPlaying = false
    @State var isThirdView = false
    @State var isfourthView = false
    
    func PlayMusic() {
        if let music = Bundle.main.url(forResource: "DNA", withExtension:"mp3") {
            do {
                AudioPlayer = try AVAudioPlayer(contentsOf: music)
                AudioPlayer?.prepareToPlay()
                AudioPlayer?.play()
            } catch {
                print("Error playing sound: \(error)")
            }
        } else {
            print("Sound file not found")
        }
    }
    func selectRandomStrings() {
        var tempStrings = option2
        randomoption1 = tempStrings.remove(at:Int.random(in: 0..<tempStrings.count))
        randomoption2 = tempStrings.remove(at:Int.random(in: 0..<tempStrings.count))
        randomoption3 = tempStrings.remove(at:Int.random(in: 0..<tempStrings.count))
        randomoption4 = tempStrings.remove(at:0)
    }
    var body: some View {
        VStack {
            Spacer()
            Text("曲名を選択してください！")
                .padding()
                .font(.title3)
            Button(randomoption1) {
                if randomoption1 == "DNA" {
                    isThirdView = true
                } else {
                    isfourthView = true
                }
                AudioPlayer?.stop()
            }
            .padding()
            .sheet(isPresented: $isfourthView) {
                fourthView()
                    .presentationDetents([.large])
            }
            .sheet(isPresented: $isThirdView) {
                ThirdView()
                    .presentationDetents([.large])
            }
            Button(randomoption2) {
                if randomoption2 == "DNA" {
                    isThirdView = true
                } else {
                    isfourthView = true
                }
                AudioPlayer?.stop()
            }
            .padding()
            .sheet(isPresented: $isfourthView) {
                fourthView()
                    .presentationDetents([.large])
            }
            Button(randomoption3) {
                if randomoption3 == "DNA" {
                    isThirdView = true
                } else {
                    isfourthView = true
                }
                AudioPlayer?.stop()
            }
            .padding()
            .sheet(isPresented: $isThirdView) {
                ThirdView()
                    .presentationDetents([.large])
            }
            .sheet(isPresented: $isfourthView) {
                fourthView()
                    .presentationDetents([.large])
            }
            Button(randomoption4) {
                if randomoption4 == "DNA" {
                    isThirdView = true
                } else {
                    isfourthView = true
                }
                AudioPlayer?.stop()
            }
            .padding()
            .sheet(isPresented: $isfourthView) {
                fourthView()
                    .presentationDetents([.large])
            }
            .sheet(isPresented: $isThirdView) {
                ThirdView()
                    .presentationDetents([.large])
            }
            Button("再生"){
                isPlaying = true
                self.PlayMusic()
                self.selectRandomStrings()
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    timer?.invalidate()
                    timer = nil
                    isPlaying = false
                }
            }
            .padding()
            .font(.largeTitle)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .disabled(isPlaying)
            .onAppear {
            }
            Spacer()
        }
        .padding()
    }
}
#Preview {
    fifthView()
}
