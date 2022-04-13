//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Thomas Cowern New on 4/13/22.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    
    
    
    var body: some View {
        Text("Hello World")
        
        
        
        
//        NavigationView {
//            NavigationLink {
//                Text("New Secondary")
//            } label: {
//                Text("Hello World")
//            }
//            .navigationTitle("Primary")
//
//            Text("Secondary")
//
//            Text("Tertiary")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
