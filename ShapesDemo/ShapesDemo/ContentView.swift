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
            Circle()
                .stroke(Color.green)
                .foregroundColor(Color.yellow)
                .frame(width: 100)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
