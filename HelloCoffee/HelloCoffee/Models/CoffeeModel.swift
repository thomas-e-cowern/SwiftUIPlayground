//
//  CoffeeModel.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/6/22.
//

import Foundation

@MainActor
class CoffeeModel: ObservableObject {
    
    let webService: WebService
    @Published private(set) var orders: [Order] = []
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func populateOrders() async throws {
        orders = try await webService.getOrders()
    }
    
}
