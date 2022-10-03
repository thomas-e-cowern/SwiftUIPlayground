//
//  MVPatternExampleApp.swift
//  MVPatternExample
//
//  Created by Thomas Cowern on 10/3/22.
//

import SwiftUI

@main
struct MVPatternExampleApp: App {
    
    @StateObject private var storeModel = StoreModel(webService: WebService())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}
