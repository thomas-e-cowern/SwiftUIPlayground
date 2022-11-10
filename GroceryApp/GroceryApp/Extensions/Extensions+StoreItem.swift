//
//  Extensions+StoreItem.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/10/22.
//

import Foundation

extension StoreItem {
    
    static func from(_ storeItemViewState: StoreItemViewState) -> StoreItem {
        return StoreItem(name: storeItemViewState.name, price: Double(storeItemViewState.price) ?? 0.0, quantity: Int(storeItemViewState.quantity) ?? 0)
    }
}
