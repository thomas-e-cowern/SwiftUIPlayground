//
//  CarouselComponent.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/20/22.
//

import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    
    let uiModel: CarouselUIModel
    
    var uniqueId: String {
        ComponentType.carousel.rawValue
    }
    
    func render() -> AnyView {
        CarouselView(uiModel: uiModel).toAnyView()
    }
}
