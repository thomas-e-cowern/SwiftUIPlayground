//
//  User.swift
//  FilterListExample
//
//  Created by Thomas Cowern on 12/8/22.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: UUID
    let name: String
    let company: String
    let email: String
    let phone: String
    let address: String
}
