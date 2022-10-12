//
//  WebService.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/6/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badRequest
    case decodingError
}

class WebService {
    
    private var baseUrl: URL
    
    init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }
    
    func placeOrder(order: Order) async throws -> Order {
        guard let url = URL(string: Endpoints.placeOrder.path, relativeTo: baseUrl) else {
            print("Bad place order url")
            throw NetworkError.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(order)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let newOrder = try? JSONDecoder().decode(Order.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return newOrder
    }
    
    func getOrders() async throws -> [Order] {
        // https://powerful-melted-jam.glitch.me

        guard let url = URL(string: Endpoints.allOrders.path, relativeTo: baseUrl) else {
            print("Bad url")
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let orders = try? JSONDecoder().decode([Order].self, from: data) else {
            throw NetworkError.decodingError
        }

        return orders
    }
    
    func deleteOrder(orderId: Int) async throws -> Order {
        
        guard let url = URL(string: Endpoints.deleteOrder(orderId).path, relativeTo: baseUrl) else {
            print("Bad url")
            throw NetworkError.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print("Response: \(response)")
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let deletedOrder = try? JSONDecoder().decode(Order.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return deletedOrder
    }
    
}
