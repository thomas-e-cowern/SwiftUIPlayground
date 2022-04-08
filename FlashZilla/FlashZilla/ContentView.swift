//
//  ContentView.swift
//  FlashZilla
//
//  Created by Thomas Cowern New on 4/5/22.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    
    // @State properties
    @State private var cards = [Card](repeating: Card.example, count: 10)
    @State private var timeRemaining = 100
    @State private var isActive = true
    @State private var showingEditScreen = false
    
    // @Evnironment properties
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    
    // properties
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                  removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                        .allowsHitTesting(index == cards.count - 1)
                        .accessibilityHidden(index < cards.count - 1)
                    }                    
                }
                .allowsHitTesting(timeRemaining > 0)
                
                
                if cards.isEmpty {
                    Button("Start Again?", action: resetCards   )
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                }
                
                VStack {
                    HStack {
                        Spacer()

                        Button {
                            showingEditScreen = true
                        } label: {
                            Image(systemName: "plus.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                    }

                    Spacer()
                }
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding()
                
                if differentiateWithoutColor || voiceOverEnabled {
                    VStack {
                        Spacer()

                        HStack {
                            Button {
                                    withAnimation {
                                        removeCard(at: cards.count - 1)
                                    }
                                } label: {
                                    Image(systemName: "xmark.circle")
                                        .padding()
                                        .background(.black.opacity(0.7))
                                        .clipShape(Circle())
                                }
                                .accessibilityLabel("Wrong")
                                .accessibilityHint("Mark your answer as being incorrect.")

                                Spacer()

                                Button {
                                    withAnimation {
                                        removeCard(at: cards.count - 1)
                                    }
                                } label: {
                                    Image(systemName: "checkmark.circle")
                                        .padding()
                                        .background(.black.opacity(0.7))
                                        .clipShape(Circle())
                                }
                                .accessibilityLabel("Correct")
                                .accessibilityHint("Mark your answer as being correct.")
                        }
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                    }
                }
            }
        }
        .onReceive(timer) { time in
            
            guard isActive else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                if !cards.isEmpty {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
    }
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        
        cards.remove(at: index)
        
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards () {
        cards = [Card] (repeating: Card.example, count: 10)
        timeRemaining = 100
        isActive = true
    }
}
