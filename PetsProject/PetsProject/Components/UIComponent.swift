//
//  UIComponent.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import Foundation
import SwiftUI

protocol UIComponent {
    var id: UUID { get }
    
    func render() -> AnyView
}
