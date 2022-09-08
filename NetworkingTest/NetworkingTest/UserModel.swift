//
//  UserModel.swift
//  NetworkingTest
//
//  Created by Thomas Cowern on 9/8/22.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let company: Company
}

struct Company: Codable {
    let name: String
}
