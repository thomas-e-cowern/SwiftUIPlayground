//
//  ContentView.swift
//  MultipleRequests
//
//  Created by Thomas Cowern New on 8/15/22.
//

import SwiftUI
import Combine

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}

struct ContentView: View {
    
    @State private var requests = Set<AnyCancellable>()
    @State private var messages = [Message]()
    @State private var favorites = Set<Int>()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
