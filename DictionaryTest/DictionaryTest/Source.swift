//
//  Source.swift
//  DictionaryTest
//
//  Created by Thomas Cowern New on 4/27/22.
//

import Foundation

struct Source: Codable {
    var id: String?
    var name: String?
    
    static let exampleSource = Source(id: "1", name: "Example")
}
