//
//  NetworkExampleApp.swift
//  NetworkExample
//
//  Created by Thomas Cowern New on 8/11/22.
//

import SwiftUI

@main
struct NetworkExampleApp: App {
    
    let monitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(monitor)
        }
    }
}
