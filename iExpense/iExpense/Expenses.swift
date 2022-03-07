//
//  Expenses.swift
//  iExpense
//
//  Created by Thomas Cowern New on 3/7/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
