//
//  ContentView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/25/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<10) { item in
                Text("Hello, world!")
                    .padding()
            }
            .navigationTitle("Crypto Portfolio")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
