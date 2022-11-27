//
//  CustomEmailTextViewStyle.swift
//  SwiftUIShapesChallenge
//
//  Created by Thomas Cowern on 11/27/22.
//

import Foundation
import SwiftUI

struct CustomEmailTextViewStyle: TextFieldStyle {
    
    var myGradient = Gradient(
        colors: [
            Color(.red),
            Color(.blue)
        ]
    )
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack {
            HStack {
                Image(systemName: "envelope")
                configuration
            }
            .padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(LinearGradient(gradient: myGradient, startPoint: .leading, endPoint: .trailing))
                .frame(height: 40)
        }
        
    }
}
