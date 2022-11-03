//
//  ContentView.swift
//  Lesson4Challenge
//
//  Created by Thomas Cowern on 11/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.black
                VStack {
                    Circle()
                        .fill(.yellow)
                        .blur(radius: 80)
                        .shadow(radius: 45, x: 0, y: 20)
                        .padding()
                    Circle()
                        .fill(.radialGradient(Gradient(colors: [.blue, .yellow]), center: .center, startRadius: 0, endRadius: 360))
                        .blur(radius: 1)
                        .shadow(color: .yellow, radius: 45, x: -10, y: -20)
                        .padding()
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
