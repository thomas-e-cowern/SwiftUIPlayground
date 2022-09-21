//
//  CarouselUIModel.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/20/22.
//

import Foundation

struct CarouselUIRowModel: Decodable, Identifiable {
    let id = UUID()
    let petId: Int
    let imageUrl: String
    
    private enum CodingKeys: CodingKey {
        case petId
        case imageUrl
    }
}

struct CarouselUIModel: Decodable {
    let items: [CarouselUIRowModel]
    let action: Action
}
