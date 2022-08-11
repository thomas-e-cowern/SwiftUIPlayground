//
//  ContentView.swift
//  NetworkExample
//
//  Created by Thomas Cowern New on 8/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var network: NetworkMonitor
    
    var body: some View {
        Text(verbatim: """
        Active: \(network.isActive)
        Expensive: \(network.isExpensive)
        Constrained: \(network.isConstrained)
        """)
            .padding()
        
        Button("Fetch Data") {
            network.makeRequest()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
