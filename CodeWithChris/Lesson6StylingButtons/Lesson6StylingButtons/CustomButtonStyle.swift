//
//  CustomButtonStyle.swift
//  Lesson6StylingButtons
//
//  Created by Thomas Cowern on 11/27/22.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Capsule()
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
                .frame(height: 50)
            configuration.label
                .foregroundColor(.white)
        }
        .opacity(configuration.isPressed ? 0.2 : 1)
        .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
    
}
