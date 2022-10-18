//
//  BudgetListView.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/18/22.
//

import SwiftUI

struct BudgetListView: View {
    
    let budgetCategoryResults: FetchedResults<BudgetCategory>
    
    let onDeleteBudgetCategory: (BudgetCategory) -> Void
    
    var body: some View {
        List {
            if budgetCategoryResults.isEmpty {
                HStack {
                    Text("No Budget Categories Exist")

                }
            } else {
                ForEach(budgetCategoryResults) { category in
                    HStack {
                        Text(category.title ?? "")
                        Spacer()
                        VStack {
                            Text(category.total as NSNumber, formatter: NumberFormatter.currency)
                        }
                    }
                }
                .onDelete { IndexSet in
                    IndexSet.map { budgetCategoryResults[$0] }.forEach(onDeleteBudgetCategory)
                }
            }
        }
    }
}
