//
//  ContentView.swift
//  Lesson3Challenge
//
//  Created by Thomas Cowern on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    
    let chevronShape: Path = {
        return Path({ path in
            path.move(to: CGPoint(x: 30, y: 100))
            path.addLine(to: CGPoint(x: 130, y: 100))
            path.addLine(to: CGPoint(x: 230, y: 350))
            path.addLine(to: CGPoint(x: 130, y: 600))
            path.addLine(to: CGPoint(x: 30, y: 600))
            path.addLine(to: CGPoint(x: 130, y: 350))
            path.closeSubpath()
        })
    }()
    
    let starShape: Path = {
        return  Path({ path in
            path.move(to: CGPoint(x: 70, y: 320))
            path.addLine(to: CGPoint(x: 150, y: 320))
            path.addLine(to: CGPoint(x: 110, y: 430))
            path.addLine(to: CGPoint(x: 70, y: 320))
            path.closeSubpath()
            
            path.move(to: CGPoint(x: 110, y: 280))
            path.addLine(to: CGPoint(x: 150, y: 400))
            path.addLine(to: CGPoint(x: 70, y: 400))
            path.addLine(to: CGPoint(x: 110, y: 280))
            path.closeSubpath()
        })
    }()
    
    var body: some View {
        HStack {
            chevronShape
            .foregroundColor(.blue)
            
           starShape
            .foregroundColor(.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
