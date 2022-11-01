//
//  ContentView.swift
//  ShapesDemo
//
//  Created by Thomas Cowern on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.black, style: StrokeStyle(lineWidth: 10, dash: [1, 1], dashPhase: 7))
                    .frame(width: 100)
                Circle()
                    .foregroundColor(Color.yellow)
                    .frame(width: 100)
            }
            
            Ellipse()
                .frame(width: 100, height: 50)
            
            Rectangle()
                .foregroundColor(Color.blue)
                .cornerRadius(25)
                .frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 100, height: 100)
            
            ZStack {
                Capsule()
                    .frame(width: 100, height: 40)
                Text("Press Me")
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
