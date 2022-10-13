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
    
    func placeOrder(_ order: Order) async throws {
        let newOrder = try await webService.placeOrder(order: order)
        orders.append(newOrder)
    }
    
    func deleteOrder(_ orderId: Int) async throws {
        let deletedOrder = try await webService.deleteOrder(orderId: orderId)
        orders = orders.filter { $0.id != deletedOrder.id }
    }
    
    func updateOrder(_ order: Order) async throws {
        let updatedOrder = try await webService.updateOrder(order: order)
        guard let index = orders.firstIndex(where: { $0.id == updatedOrder.id }) else {
            throw CoffeeOrderError.invalidOrderId 
        }
        orders[index] = updatedOrder
    }
}
