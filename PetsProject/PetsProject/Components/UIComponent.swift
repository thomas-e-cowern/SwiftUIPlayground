//
//  UIComponent.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import Foundation
import SwiftUI

protocol UIComponent {
    var uniqueId: String { get }
    
    func render() -> AnyView
}
