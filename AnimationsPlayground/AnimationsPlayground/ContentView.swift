//
//  ContentView.swift
//  AnimationsPlayground
//
//  Created by Thomas Cowern New on 3/5/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK:  Properties
    @State private var animationAmount: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Button("Tap Me") {
//                animationAmount += 1
            }
            .onAppear(perform: {
                animationAmount = 2
            })
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
//            .scaleEffect(animationAmount)
            .overlay(
                Circle()
                    .stroke(.blue)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(.easeInOut(duration: 2)
                                .repeatForever(autoreverses: false), value: animationAmount)
            )
//            .animation(.default, value: animationAmount)
//            .blur(radius: (animationAmount - 1) * 3)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
