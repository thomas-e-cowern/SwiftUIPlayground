//
//  ContentView.swift
//  ShapesDemo
//
//  Created by Thomas Cowern on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.green)
                .frame(width: 100)
            Circle()
                .foregroundColor(Color.yellow)
                .frame(width: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
