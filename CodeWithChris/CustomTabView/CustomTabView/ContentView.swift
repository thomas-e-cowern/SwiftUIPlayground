//
//  ContentView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Spacer()
            
            HStack {
                
                ForEach(0..<5, id:\.self) { _ in
                    VStack (spacing: 5) {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                            .font(.caption)
                    }
                    .padding(.vertical)
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
