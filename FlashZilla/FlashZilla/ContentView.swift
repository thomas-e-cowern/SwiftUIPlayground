//
//  ContentView.swift
//  FlashZilla
//
//  Created by Thomas Cowern New on 4/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentAmount = 0.0
    @State private var finalAmout = 1.0
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .scaleEffect(finalAmout + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        currentAmount = amount - 1
                    }
                    .onEnded { amount in
                        finalAmout += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
