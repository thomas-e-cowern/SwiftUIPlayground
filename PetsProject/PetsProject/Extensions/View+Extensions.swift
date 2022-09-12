//
//  View+Extensions.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import Foundation
import SwiftUI

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
