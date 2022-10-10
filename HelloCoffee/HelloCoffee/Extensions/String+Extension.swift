//
//  String+Extension.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/10/22.
//

import Foundation

extension String {
    
    var isNumberic: Bool {
        Double(self) != nil
    }
    
    func isLessThan(_ number: Double) -> Bool {
        if !self.isNumberic {
            return false
        }
        
        guard let value = Double(self) else {
            return false
        }
        
        return value < number
    }
    
}
