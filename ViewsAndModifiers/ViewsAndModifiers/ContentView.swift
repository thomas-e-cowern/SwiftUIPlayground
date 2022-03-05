//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Thomas Cowern New on 3/4/22.
//

import SwiftUI

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.pink.opacity(0.5))
            
            Color.blue
                .frame(width: 100, height: 100)
                .watermarked(with: "Hacking with Tom")
            
            Button("Click Me"){
                print(type(of: self.body))
            }
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .padding()
            .background(.red)
            .padding()
            .background(.yellow)
            .padding()
            .background(.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
