//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thomas Cowern New on 3/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red
            VStack {
                HStack {
                    Text("One")
                    Text("Two")
                    Text("Three")
                }
                HStack {
                    Text("One")
                    Text("Two")
                    Text("Three")
                }
                HStack {
                    Text("One")
                    Text("Two")
                    Text("Three")
                }
            }
            .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
