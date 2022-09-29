//
//  ListComponent.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/29/22.
//

import Foundation
import SwiftUI

struct ListComponent: UIComponent {
    
    let id = UUID()
    let uidModel: ListUIModel
    
    func render() -> AnyView {
        
        ForEach(uidModel.rows, id: \.id) { row in
            RowComponent(uiModel: row).render().toAnyView()
            
        }.toAnyView()
    }
}
