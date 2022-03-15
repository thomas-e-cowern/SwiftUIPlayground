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
    
    @Published var extraFrosting: Bool = false
    @Published var addSprinkles: Bool = false
    
    @Published var name: String = ""
    @Published var street: String = ""
    @Published var city: String = ""
    @Published var zip: String = ""
    
    @Published var specialRequestEnabled: Bool = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var hasValidAddress: Bool {
        if name.isEmpty || street.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cupcake
        var cost = Double(quantity) * 2
        
        // complicate cupcakes are more
        cost += (Double(type)/2)
        
        // $1 for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // .50 for extra sprinkles
        if addSprinkles {
            cost += Double(quantity)/2
        }
        
        return cost
    }
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, street, city, zip
    }
}
