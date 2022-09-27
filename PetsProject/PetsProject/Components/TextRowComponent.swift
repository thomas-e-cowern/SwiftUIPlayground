//
//  TextRowComponent.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/27/22.
//

import Foundation
import SwiftUI

struct TextRowComponent: UIComponent {
    
    var id: UUID = UUID()

    let uiModel: TextRowUIModel
    
    func render() -> AnyView {
        Text(uiModel.text).toAnyView()
    }
}
