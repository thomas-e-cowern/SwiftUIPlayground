//
//  ContentView.swift
//  BlursAndGradients
//
//  Created by Thomas Cowern on 11/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(.blue)
                .frame(width: 200, height: 40)
            Text("Howdy")
                .foregroundColor(.white)
        }
        .shadow(color: .yellow, radius: 20, x: 5, y: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
