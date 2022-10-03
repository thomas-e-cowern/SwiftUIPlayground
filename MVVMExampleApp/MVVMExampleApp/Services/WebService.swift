//
//  WebService.swift
//  MVVMExampleApp
//
//  Created by Thomas Cowern on 10/3/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badRequest
}


class WebService {
    
    func getProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
                
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
    }
    
}
