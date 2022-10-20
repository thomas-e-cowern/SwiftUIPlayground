//
//  AddBudgetCategoryView.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/17/22.
//

import SwiftUI

struct AddBudgetCategoryView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var total: Double = 0.0
    @State private var messages: [String] = []
    private var budgetCategoryToEdit: BudgetCategory?
    
    init(budgetCategoryToEdit: BudgetCategory? = nil) {
        self.budgetCategoryToEdit = budgetCategoryToEdit
    }
    
    var isFormValid: Bool {
        
        messages.removeAll()
        
        if title.isEmpty {
            messages.append("Title is required")
        }
        
        if total <= 0 {
            messages.append("Total must be greater than zero")
        }
        
        return messages.count == 0
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                Slider(value: $total, in: 0...1000, step: 10) {
                    Text("Total")
                } minimumValueLabel: {
                    Text("$0")
                } maximumValueLabel: {
                    Text("$1000")
                }
                
                Text(total as NSNumber, formatter: NumberFormatter.currency)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(messages, id:\.self) { message in
                    Text(message)
                }
            }
            .onAppear {
                if let budgetCategoryToEdit {
                    title = budgetCategoryToEdit.title ?? ""
                    total = budgetCategoryToEdit.total
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if isFormValid {
                            saveOrUpdate()
                            dismiss()
                        }
                    }
                }
            }
        }
    }
    
    private func saveOrUpdate() {
        if let budgetCategoryToEdit {
            // update existing category
            let budget = BudgetCategory.byId(budgetCategoryToEdit.objectID)
            budget.title = title
            budget.total = total
        } else {
            // save new buget category
            let budgetCategory = BudgetCategory(context: viewContext)
            budgetCategory.title = title
            budgetCategory.total = total
        }
        
        do {
            try viewContext.save()
            dismiss()
        } catch {
            print("Error in saveOrUpdate: \(error.localizedDescription)")
        }
    }
}

struct AddBudgetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetCategoryView()
    }
}
