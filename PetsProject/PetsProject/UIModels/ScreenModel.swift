//
//  ScreenModel.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import Foundation

enum ComponentError: Error {
    case decodingError
}

enum ComponentType: String, Decodable {
    case featuredImage
    case carousel
    case textRow
    case ratingRow
}

struct ComponentModel: Decodable {
    let type: ComponentType
    let data: [String: Any]
    
    private enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ComponentType.self, forKey: .type)
        self.data = try container.decode(JSON.self, forKey: .data).value as! [String: Any]
    }
}

struct ScreenModel: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}

extension ScreenModel {
    
    func buildComponents() throws -> [UIComponent] {
        
        var components: [UIComponent] = []
        
        for component in self.components {
            switch component.type {
                case .featuredImage:
                print("Inside featured image in screen model")
                    guard let uiModel: FeaturedImageUIModel = component.data.decode() else {
                        throw ComponentError.decodingError
                    }
                    components.append(FeaturedImageComponent(uiModel: uiModel))
            case .carousel:
                guard let uiModel: CarouselUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(CarouselComponent(uiModel: uiModel))
            case .textRow:
                print("Inside text row in screen model")
                guard let uiModel: TextRowUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(TextRowComponent(uiModel: uiModel))
                
            case .ratingRow:
                guard let uiModel: RatingRowUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(RatingRowComponent(uiModel: uiModel))
            }
        }
        
        return components
        
    }
    
}
