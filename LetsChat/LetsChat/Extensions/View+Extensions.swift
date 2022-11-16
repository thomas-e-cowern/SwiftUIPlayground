//
//  View+Extensions.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/16/22.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
