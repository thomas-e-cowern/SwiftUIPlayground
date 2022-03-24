//
//  ContentView.swift
//  HotProspects
//
//  Created by Thomas Cowern New on 3/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var prospects = Prospects()
    
    var body: some View {
        
        TabView {

            ProspectView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MyView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
        .environmentObject(prospects)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
