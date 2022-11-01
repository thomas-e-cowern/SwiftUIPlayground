//
//  ContentView.swift
//  Lesson2Challenge
//
//  Created by Thomas Cowern on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke()
                    .stroke(style: StrokeStyle(lineWidth: 3))
                    .foregroundColor(Color.blue)
                    .frame(width: 200, height: 200)
                
                Circle()
                    .stroke()
                    .frame(width: 190)
                
                Ellipse()
                    .stroke()
                    .stroke(style: StrokeStyle(dash: [8, 10]))
                    .frame(width: 85, height: 190)
                
                Ellipse()
                    .stroke()
                    .stroke(style: StrokeStyle(dash: [8, 10]))
                    .frame(width: 190, height: 85)
                
                ZStack {
                    Circle()
                        .foregroundColor(.red)
                        .frame(width: 75)
                    Circle()
                        .foregroundColor(.orange)
                        .frame(width: 60)
                    Circle()
                        .foregroundColor(.yellow)
                        .frame(width: 45)
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 30)
                }
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
