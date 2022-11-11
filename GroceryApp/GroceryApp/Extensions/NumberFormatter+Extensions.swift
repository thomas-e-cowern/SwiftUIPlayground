//
//  NumberFormatter+Extensions.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/10/22.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
}
