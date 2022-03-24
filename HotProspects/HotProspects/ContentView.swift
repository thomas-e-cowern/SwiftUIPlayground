//
//  ContentView.swift
//  HotProspects
//
//  Created by Thomas Cowern New on 3/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            ProspectView()
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectView()
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectView()
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MyView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
