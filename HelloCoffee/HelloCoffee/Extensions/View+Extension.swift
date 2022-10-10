//
//  View+Extension.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/10/22.
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
    
    @ViewBuilder
    func visible(_ value: Bool) -> some View {
        if value == true {
            self
        } else {
            EmptyView()
        }
    }
}
