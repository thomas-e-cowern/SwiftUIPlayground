//
//  WebService.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidServerResponse
}

class WebService: NetworkService {
    
    func load(_ resource: String) async throws -> ScreenModel {
        
        guard let url = Constants.ScreenResources.resource(for: resource) else {
            throw NetworkError.invalidUrl
        }
        print("URL from WebService: \(url)")
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        print("Http response: \(httpResponse.statusCode)")
        print("About to try")
        return try JSONDecoder().decode(ScreenModel.self, from: data)
    }
    
}
