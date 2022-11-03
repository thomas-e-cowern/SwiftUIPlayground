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
            
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: UnitPoint(x: 0.1, y: 0.1), endPoint: UnitPoint(x: 0.5, y: 0.9))
                .ignoresSafeArea()
            VStack {
                
                // Linear Gradietn
                ZStack {
                    Capsule()
                        .fill(.linearGradient(Gradient(colors: [Color.blue, Color.orange]), startPoint: .leading, endPoint: .trailing))
                        .frame(width: 200, height: 40)
                    Text("Howdy")
                        .foregroundColor(.white)
                }
                
                // Radial Gradient
                ZStack {
                    Capsule()
                        .fill(.radialGradient(Gradient(colors: [Color.blue, Color.orange]), center: .center, startRadius: 0, endRadius: 100))
                        .frame(width: 200, height: 40)
                    Text("Howdy")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
