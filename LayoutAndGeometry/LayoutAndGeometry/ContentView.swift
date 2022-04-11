//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Thomas Cowern New on 4/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("@thomas.e.cowern")
                Image("thomas-cowern-small")
                    . resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full Name:")
                Text("Thomas Cowern")
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
