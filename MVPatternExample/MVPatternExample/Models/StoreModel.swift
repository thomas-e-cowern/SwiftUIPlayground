//
//  StoreModel.swift
//  MVPatternExample
//
//  Created by Thomas Cowern on 10/3/22.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    let webService: WebService
    
    @Published var products: [Product] = []
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func populateProducts() async throws {
        
        products = try await webService.getProducts()
        
    }
    
}
