//
//  ContentView.swift
//  CustomFont
//
//  Created by Thomas Cowern on 11/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .font(.custom("Rubik Microbe", size: 20))
        }
        .padding()
    }
    
    init() {
        for familyName in UIFont.familyNames {
            print(familyName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
