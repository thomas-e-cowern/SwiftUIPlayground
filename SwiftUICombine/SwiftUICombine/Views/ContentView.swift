//
//  ContentView.swift
//  SwiftUICombine
//
//  Created by Thomas Cowern on 10/30/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ScrollView {
                Image("ReceiveValue")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                Image("FinishedCompletion")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                Image("ErrorCompletion")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
            }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
