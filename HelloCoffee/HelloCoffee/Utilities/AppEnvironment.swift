//
//  AppEnvironment.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/7/22.
//

import Foundation

enum Endpoints {
    case allOrders
    
    var path: String {
        switch self {
        case .allOrders:
            return "/orders"
        }
    }
}

enum AppEnvironment: String {
    case dev
    case test
    
    var baseUrl: URL {
        
        switch self {
        case .dev:
            return URL(string: "https://island-bramble.glitch.me")!

        case .test:
            return URL(string: "https://island-bramble.glitch.me")!
        }
    }
}
