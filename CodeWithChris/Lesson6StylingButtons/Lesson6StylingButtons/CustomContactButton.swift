//
//  CustomContactButton.swift
//  Lesson6StylingButtons
//
//  Created by Thomas Cowern on 11/27/22.
//

import Foundation
import SwiftUI

struct CustomContactButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Rectangle()
                .fill(configuration.isPressed ? .black : .white)
                .border(.black)
                .frame(height: 50)
            configuration.label
                .foregroundColor(configuration.isPressed ? .white : .black)
        }
    }
    
}
