//
//  Store.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/8/22.
//

import Foundation

struct Store: Codable {
    var id: String?
    var name: String
    var address: String
    var items: [String]?
}
