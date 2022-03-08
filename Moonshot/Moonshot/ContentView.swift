//
//  ContentView.swift
//  Moonshot
//
//  Created by Thomas Cowern New on 3/8/22.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new custom text")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
