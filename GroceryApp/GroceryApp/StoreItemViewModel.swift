//
//  StoreItemViewModel.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/10/22.
//

import Foundation

struct StoreItemViewModel {
    let storeItem: StoreItem
    
    var storeItemId: String {
        return storeItem.id ?? ""
    }
    
    var name: String {
        storeItem.name
    }
    
    var price: Double {
        storeItem.price
    }
    
    var quantity: Int {
        storeItem.quantity
    }
}
