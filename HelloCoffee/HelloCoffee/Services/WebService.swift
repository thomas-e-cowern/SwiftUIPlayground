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
    
}
