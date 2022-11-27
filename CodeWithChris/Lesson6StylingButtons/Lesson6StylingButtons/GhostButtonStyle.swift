//
//  GhostButtonStyle.swift
//  Lesson6StylingButtons
//
//  Created by Thomas Cowern on 11/27/22.
//

import Foundation
import SwiftUI

struct GhostButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(height: 50)
                .shadow(radius: configuration.isPressed ? 0 : 7.5)
            configuration.label
                .foregroundColor(.gray)
        }
    }
    
}
