//
//  BudgetDetailView.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/19/22.
//

import SwiftUI

struct BudgetDetailView: View {
    
    let budgetCategory: BudgetCategory
    
    @State private var title: String = ""
    @State private var total: Double = 0.0
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(budgetCategory.title ?? "")
                        .font(.largeTitle)
                    HStack {
                        Text("Budget:")
                        Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                    }
                    .fontWeight(.bold)
                }
            }
        }
        
        Form {
            Section {
                Text("Content")
            } header: {
                Text("Add Transaction")
            }
        }
        
        Spacer()
    }
}

struct BudgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetailView(budgetCategory: BudgetCategory())
    }
}
