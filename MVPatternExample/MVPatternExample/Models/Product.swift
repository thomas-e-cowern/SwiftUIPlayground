//
//  Product.swift
//  MVPatternExample
//
//  Created by Thomas Cowern on 10/3/22.
//

import Foundation

struct Product: Codable, Identifiable {
    var id: Int
    var title: String
    var price: Double
}
