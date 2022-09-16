//
//  LocalService.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/16/22.
//

import Foundation

class LocalService: NetworkService {
    func load(_ resourceName: String) async throws -> ScreenModel {
        
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            fatalError("Resource file \(resourceName) not found!")
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let screenModel = try JSONDecoder().decode(ScreenModel.self, from: data)
        return screenModel
    }
}
	
