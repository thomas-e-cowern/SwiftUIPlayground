//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Thomas Cowern New on 3/7/22.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
