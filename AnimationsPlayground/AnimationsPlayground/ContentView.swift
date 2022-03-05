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
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .animation(.default, value: animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
        }
//        .animation(.default, value: animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
