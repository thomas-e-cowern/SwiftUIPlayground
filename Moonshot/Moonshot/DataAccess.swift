//
//  DataAccess.swift
//  Moonshot
//
//  Created by Thomas Cowern New on 3/8/22.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        guard let url = self .url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle: url")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) in bundle: data")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
            fatalError("Failed to locate \(file) in bundle: decoder")
        }
        
        return loaded
    }
}
