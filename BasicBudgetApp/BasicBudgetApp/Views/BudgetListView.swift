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
    let onEditBudgetCategory: (BudgetCategory) -> Void
    
    var body: some View {
        List {
            if budgetCategoryResults.isEmpty {
                HStack {
                    Text("No Budget Categories Exist")

                }
            } else {
                ForEach(budgetCategoryResults) { category in
                    NavigationLink(value: category) {
                        HStack {
                            Text(category.title ?? "")
                            Spacer()
                            VStack (alignment: .trailing, spacing: 10) {
                                Text(category.total as NSNumber, formatter: NumberFormatter.currency)
                                Text("\(category.overSpent ? "Overspent" : "Remaining") \(Text(category.remainingBudgetTotal as NSNumber, formatter: NumberFormatter.currency))")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .fontWeight(.bold)
                                    .foregroundColor(category.overSpent ? .red : .green)
                                    
                            }
                        }
                        .contentShape(Rectangle())
                        .onLongPressGesture {
                            onEditBudgetCategory(category)
                        }
                    }
                }
                .onDelete { IndexSet in
                    IndexSet.map { budgetCategoryResults[$0] }.forEach(onDeleteBudgetCategory)
                }
            }
        }
        .navigationDestination(for: BudgetCategory.self) { category in
            BudgetDetailView(budgetCategory: category)
        }
    }
}
