//
//  ProductListViewModel.swift
//  MVVMExampleApp
//
//  Created by Thomas Cowern on 10/3/22.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    
    let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func populateProducts() async {
        
        do {
            let products = try await webService.getProducts()
            self.products = products.map(ProductViewModel.init)
        } catch {
            print("Error in populate products \(error.localizedDescription)")
        }
    }
    
}

struct ProductViewModel: Identifiable {
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        product.id
    }
    
    var title: String {
        product.title
    }
    
    var price: Double {
        product.price
    }
}
