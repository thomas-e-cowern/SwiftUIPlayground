//
//  RowComponent.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/29/22.
//

import Foundation
import SwiftUI

struct RowComponent: UIComponent {
    
    let id = UUID()
    let uiModel: RowUIModel
    
    func render() -> AnyView {
        HStack {
            if let imageUrl = uiModel.imageUrl {
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }.toAnyView()
            }
            
            VStack {
                Text(uiModel.title)
                Text(uiModel.subTitle ?? "").opacity(0.4)
                Text(uiModel.description ?? "")
            }
        }.padding()
            .toAnyView()
    }
}
