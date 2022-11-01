//
//  ContentView.swift
//  PathLesson
//
//  Created by Thomas Cowern on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Path({ path in
                // Commands to draw path
                path.move(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 100))
                path.closeSubpath()
                
                path.move(to: CGPoint(x: 300, y: 300))
                path.addLines([
                    CGPoint(x: 200, y: 400),
                    CGPoint(x: 300, y: 400),
                    CGPoint(x: 300, y: 300),
                    CGPoint(x: 200, y: 300)
                ])
                path.closeSubpath()
                
            })
//            .stroke(style: StrokeStyle(lineWidth: 2))
            .foregroundColor(.red)
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
