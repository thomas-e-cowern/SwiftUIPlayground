//
//  Order.swift
//  Cupcakes
//
//  Created by Thomas Cowern New on 3/14/22.
//

import Foundation

class Order: ObservableObject, Codable {
    
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
    
    init () {}
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, street, city, zip
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(name, forKey: .name)
        try container.encode(street, forKey: .street)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        name = try container.decode(String.self, forKey: .name)
        street = try container.decode(String.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
        
    }
}
