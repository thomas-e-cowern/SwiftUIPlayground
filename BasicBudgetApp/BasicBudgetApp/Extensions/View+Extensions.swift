//
//  View+Extensions.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/19/22.
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
    
    func centerVertically() -> some View  {
        VStack {
            Spacer()
            self
            Spacer()
        }
    }
}
