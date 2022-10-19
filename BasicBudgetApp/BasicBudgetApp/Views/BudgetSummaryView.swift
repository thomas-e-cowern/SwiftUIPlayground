//
//  BudgetSummaryView.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/19/22.
//

import SwiftUI

struct BudgetSummaryView: View {
    
    let budgetCategory: BudgetCategory
    
    var body: some View {
        VStack {
            Text("\(budgetCategory.overSpent ? "Overspent" : "Remaining")")
            Text(budgetCategory.remainingBudgetTotal as NSNumber, formatter: NumberFormatter.currency)
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundColor(budgetCategory.overSpent ? .red : .green)
        }
    }
}

struct BudgetSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetSummaryView(budgetCategory: BudgetCategory())
    }
}
