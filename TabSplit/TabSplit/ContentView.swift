//
//  ContentView.swift
//  TabSplit
//
//  Created by Thomas Cowern New on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Text("Hello, world!")
            }
            .navigationTitle("Tab Split")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
