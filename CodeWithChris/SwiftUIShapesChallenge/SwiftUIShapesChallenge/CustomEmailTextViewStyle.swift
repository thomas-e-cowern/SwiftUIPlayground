//
//  CustomEmailTextViewStyle.swift
//  SwiftUIShapesChallenge
//
//  Created by Thomas Cowern on 11/27/22.
//

import Foundation
import SwiftUI

struct CustomEmailTextViewStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack {
            HStack {
                Image(systemName: "envelope")
                configuration
            }
            .padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray)
                .frame(height: 40)
        }
        
    }
}
