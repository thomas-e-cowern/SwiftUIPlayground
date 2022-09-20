//
//  CarouselComponent.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/20/22.
//

import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    var uniqueId: String {
        ComponentType.carousel.rawValue
    }
    
    func render() -> AnyView {
        Text("CarouselComponent").toAnyView()
    }
}
