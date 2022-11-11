//
//  String+Extensions.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/10/22.
//

import Foundation

extension String {

    var isNumeric: Bool {
        Double(self) != nil
    }
    
    func isLessThan(_ number: Double) -> Bool {
        if !self.isNumeric {
            return false
        }
        
        guard let value = Double(self) else {
            return false
        }
        
        return value < number
    }
    
}
