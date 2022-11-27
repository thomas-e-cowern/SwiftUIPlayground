//
//  ContentView.swift
//  Lesson6StylingButtons
//
//  Created by Thomas Cowern on 11/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: { print("Label Button") }, label: {
                ZStack {
                    Capsule()
                        .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
                        .frame(height: 50)
                    Text("Label Button")
                        .foregroundColor(.white)
                }
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
