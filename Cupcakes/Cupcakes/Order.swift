//
//  Order.swift
//  Cupcakes
//
//  Created by Thomas Cowern New on 3/14/22.
//

import Foundation

class Order: ObservableObject {
    
    static let type = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type: Int = 0
    @Published var quantity: Int = 3
    
    @Published var specialRequestEnabled: Bool = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    @Published var extraFrosting: Bool = false
    @Published var addSprinkles: Bool = false
    
    @Published var name: String = ""
    @Published var street: String = ""
    @Published var city: String = ""
    @Published var zip: String = ""
}
