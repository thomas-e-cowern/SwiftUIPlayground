//
//  NumberFormatter+Extension.swift
//  MVPatternExample
//
//  Created by Thomas Cowern on 10/3/22.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
}
