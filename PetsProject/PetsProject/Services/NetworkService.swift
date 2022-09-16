//
//  NetworkService.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/16/22.
//

import Foundation

protocol NetworkService {
    func load(resource: String) async throws -> ScreenModel
}
