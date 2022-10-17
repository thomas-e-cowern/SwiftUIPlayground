//
//  NumberFormatter+Extensions.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/17/22.
//

import Foundation


extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
