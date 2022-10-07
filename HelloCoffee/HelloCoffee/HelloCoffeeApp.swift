//
//  HelloCoffeeApp.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/6/22.
//

import SwiftUI

@main
struct HelloCoffeeApp: App {
    
    @StateObject private var model: CoffeeModel
    
    init() {
        var config = Configuration()
        let webService = WebService(baseUrl: config.environment.baseUrl)
        _model = StateObject(wrappedValue: CoffeeModel(webService: webService))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
