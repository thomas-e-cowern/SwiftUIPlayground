//
//  ContentView.swift
//  MVVMFormValidation
//
//  Created by Thomas Cowern on 10/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
