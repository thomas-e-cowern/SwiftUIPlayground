//
//  ContentView.swift
//  DictionaryTest
//
//  Created by Thomas Cowern New on 4/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                viewModel.fetch()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
