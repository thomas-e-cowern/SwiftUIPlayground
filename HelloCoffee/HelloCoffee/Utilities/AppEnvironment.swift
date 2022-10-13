//
//  AppEnvironment.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/7/22.
//

import Foundation

enum Endpoints {
    case allOrders
    case placeOrder
    case deleteOrder(Int)
    case updateOrder(Int)
    
    var path: String {
        switch self {
        case .allOrders:
            return "test/orders"
        case .placeOrder:
            return "/test/new-order"
        case .deleteOrder(let orderId):
            return "/test/orders/\(orderId)"
        case .updateOrder(let orderId):
            return "/test/orders/\(orderId)"
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

struct Configuration {
    
    lazy var environment: AppEnvironment = {
       // Read the value from environment variable
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.dev
        }
        
        if env == "TEST" {
            return AppEnvironment.test
        }
        
        return AppEnvironment.dev
        
    }()
    
}
