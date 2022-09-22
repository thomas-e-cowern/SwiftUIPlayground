//
//  CarouselComponent.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/20/22.
//

import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    
    var id = UUID()
    let uiModel: CarouselUIModel
    
    func render() -> AnyView {
        CarouselView(uiModel: uiModel).toAnyView()
    }
}
