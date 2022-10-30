//
//  ContentView.swift
//  SwiftUICombine
//
//  Created by Thomas Cowern on 10/30/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
            ScrollView {
                
                Button {
                    viewModel.startFetch()
                } label: {
                    Text("Start")
                }
                
                Text("Time")
                
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
            .font(.system(size: 36, weight: .bold))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
