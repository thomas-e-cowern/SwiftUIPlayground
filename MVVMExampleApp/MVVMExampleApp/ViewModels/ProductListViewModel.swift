//
//  ProductListViewModel.swift
//  MVVMExampleApp
//
//  Created by Thomas Cowern on 10/3/22.
//

import Foundation

class ProductListViewModel: ObservableObject {
    
    let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func populateProducts() async {
        
        do {
            let products = try await webService.getProducts()
        } catch {
            print("Error in populate products \(error.localizedDescription)")
        }
    }
    
}
