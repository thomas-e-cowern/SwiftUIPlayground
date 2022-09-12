//
//  FeaturedImageComponent.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import Foundation
import SwiftUI

struct FeaturedImageComponent: UIComponent {
    
    let uiModel: FeaturedImageUIModel
    
    var uniqueId: String {
        return ComponentType.featuredImage.rawValue
    }
    
    func render() -> AnyView {
        AsyncImage(url: uiModel.imageUrl) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }.toAnyView()
    }
    
    
}
