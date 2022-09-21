//
//  Action.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/21/22.
//

import Foundation

enum ActionType: String, Decodable {
    case sheet
}

struct Action: Decodable {
    let type; ActionType
    let destination: Route
}
