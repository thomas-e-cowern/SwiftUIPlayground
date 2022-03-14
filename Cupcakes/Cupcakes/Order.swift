//
//  Order.swift
//  Cupcakes
//
//  Created by Thomas Cowern New on 3/14/22.
//

import Foundation

class Order: ObservableObject {
    
    static let type = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}
