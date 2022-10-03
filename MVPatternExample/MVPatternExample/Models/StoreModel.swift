//
//  StoreModel.swift
//  MVPatternExample
//
//  Created by Thomas Cowern on 10/3/22.
//

import Foundation

class StoreModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    func populateProducts() async {
        
    }
    
}
