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
    
    var body: some View {
        HStack {
            chevronShape
            .foregroundColor(.blue)
            
            Path({ path in
                path.move(to: CGPoint(x: <#T##Double#>, y: <#T##Double#>))
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
