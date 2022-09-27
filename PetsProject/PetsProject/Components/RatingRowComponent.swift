//
//  RatingRowComponent.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/27/22.
//

import Foundation
import SwiftUI

struct RatingRowComponent: UIComponent {
    
    let uiModel: RatingRowUIModel
     
    let id = UUID()
    
    func render() -> AnyView {
        Text("Rating \(uiModel.rating)").toAnyView()
    }
}
