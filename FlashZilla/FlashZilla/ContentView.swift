//
//  ContentView.swift
//  FlashZilla
//
//  Created by Thomas Cowern New on 4/5/22.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    
    @State private var cards = [Card](repeating: Card.example, count: 10)
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index])
                            .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }
}
