//
//  BudgetDetailView.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/19/22.
//

import SwiftUI
import CoreData

struct BudgetDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let budgetCategory: BudgetCategory
    
    @State private var title: String = ""
    @State private var total: String = ""
    
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
                TextField("Title", text: $title)
                TextField("Total", text: $total)
            } header: {
                Text("Add Transaction")
            }
            
            Button("Save Transaction") {
                // save transaction
                if isFormValid {
                    print("transaction saved")
                    saveTransaction()
                    clearEntries()
                }
            }
            .centerHorizontally()
            .disabled(!isFormValid)
        }
        
        BudgetSummaryView(budgetCategory: budgetCategory)
        
        TransactionListView(request: BudgetCategory.transactionsByCategoryRequest(budgetCategory))
        
        Spacer()
    }

    var isFormValid: Bool {
        
        guard let totalAsDouble = Double(total) else { return false}
        
        return !title.isEmpty && !total.isEmpty && totalAsDouble > 0
    }
    
    private func saveTransaction() {
        
        let transaction = Transaction(context: viewContext)
        transaction.title = title
        guard let total = Double(total) else {
            return
        }
        transaction.total = total
        
        budgetCategory.addToTransactions(transaction)
        
        do {
            try viewContext.save()
        } catch  {
            print("Error saving transaction: \(error.localizedDescription)")
        }
    }
    
    private func clearEntries() {
        title = ""
        total = ""
    }
}

struct BudgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetailView(budgetCategory: BudgetCategory())
    }
}
