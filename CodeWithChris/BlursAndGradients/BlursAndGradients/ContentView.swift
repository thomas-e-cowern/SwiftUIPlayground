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
        .blur(radius: 3, opaque: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
