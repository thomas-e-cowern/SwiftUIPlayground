//
//  ScreenModel.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import Foundation

enum ComponentErrror: Error {
    case decodingError
}

enum ComponentType: String, Decodable {
    case featuredImage
}

struct ComponentModel: Decodable {
    let type: ComponentType
    let data: [String: String]
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
                guard let uiModel: FeaturedImageUIModel = component.data.decode() else {
                    throw ComponentErrror.decodingError
                }
                
                components.append(FeaturedImageComponent(uiModel: uiModel))
            }
        }
        
        return components
    }
    
}
