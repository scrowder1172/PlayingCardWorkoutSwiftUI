//
//  ContentView.swift
//  PlayingCardWorkoutSwiftUI
//
//  Created by SCOTT CROWDER on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cardImageView: Image?
    @State private var isShowingRules: Bool = false
    @State private var timer: Timer?
    
    let cards: [UIImage] = CardDeck.allValues
    
    var body: some View {
        Group{
            if let cardImageView {
                cardImageView
                    .resizable()
                    .frame(width: 250, height: 350)
                    .padding(.vertical, 40)
            }
            
            VStack(spacing: 20){
                Button {
                    stopTimer()
                } label: {
                    Label("Stop", systemImage: "stop.circle")
                        .font(.headline)
                        .frame(width: 260, height: 40)
                }
                .buttonStyle(.bordered)
                .controlSize(.regular)
                .tint(.red)
                
                HStack{
                    Button {
                        resetTimer()
                    } label: {
                        Label("Reset", systemImage: "arrow.clockwise.circle")
                            .font(.headline)
                            .frame(width: 115, height: 40)
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.regular)
                    .tint(.green)
                    
                    Button {
                        isShowingRules = true
                    } label: {
                        Label("Rules", systemImage: "list.bullet")
                            .font(.headline)
                            .frame(width: 115, height: 40)
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.regular)
                    .tint(.blue)
                }
            }
            
        }
        .onAppear {
            startTimer()
        }
        .sheet(isPresented: $isShowingRules) {
            RulesView()
        }
    }
    
    func showRandomImage() {
        cardImageView = Image(uiImage: cards.randomElement() ?? UIImage(resource: .AS))
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            showRandomImage()
        }
    }
    
    func stopTimer() {
        if let timer {
            timer.invalidate()
        }
    }
    
    func resetTimer() {
        stopTimer()
        startTimer()
    }
    
}

#Preview {
    ContentView()
}
