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
            
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            
            Capsule()
                .foregroundColor(.blue)
                .frame(width: 200, height: 40)
            Text("Howdy")
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
