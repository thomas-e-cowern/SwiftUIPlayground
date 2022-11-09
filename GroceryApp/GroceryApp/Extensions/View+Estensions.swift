//
//  View+Estensions.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/8/22.
//

import Foundation
import SwiftUI

extension View {
    
    func centerHorizontally() -> some View {
            HStack {
                Spacer()
                self
                Spacer()
            }
        }
    
}
