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
    @State private var total: String = ""
    @State private var messages: [String] = []
    
    @Environment(\.dismiss) private var dismiss
    
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
            
            ForEach(messages, id:\.self) { message in
                Text(message)
            }
            
            Button("Save Transaction") {
                // save transaction
                if isFormValid {
                    print("transaction saved")
                    dismiss()
                }
            }
            .centerHorizontally()
        }
        
        
        
        Spacer()
    }
    
    var isFormValid: Bool {
        
        messages.removeAll()
        
        if title.isEmpty {
            messages.append("Title is required")
        }
        
        if total.isEmpty {
            messages.append("Total must be greater than zero")
        }
        
        guard let totalAsDouble = Double(total) else { return false}
        
        return messages.count == 0 && totalAsDouble > 0
    }
}

struct BudgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetailView(budgetCategory: BudgetCategory())
    }
}
