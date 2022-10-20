//
//  ContentView.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/17/22.
//

import SwiftUI

enum SheetAction: Identifiable {
    
    case add
    case edit(BudgetCategory)
    
    var id: Int {
        switch self {
            case .add:
                return 1
            case .edit(_):
                return 2
        }
    }
    
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var budgetCategoryResults: FetchedResults<BudgetCategory>
    @State private var sheetAction: SheetAction?
    
    var total: Double {
        budgetCategoryResults.reduce(0) { result, budgetCategory in
            return result + budgetCategory.total
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text(total as NSNumber, formatter: NumberFormatter.currency)
                    .fontWeight(.bold)
                BudgetListView(budgetCategoryResults: budgetCategoryResults, onDeleteBudgetCategory: { budgetCategory in
                    viewContext.delete(budgetCategory)
                    saveChanges()
                }, onEditBudgetCategory: editBudgetCategory)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add a Category"){
                        // Add category
                        sheetAction = .add
                    }
                }
            }
        }
        .sheet(item: $sheetAction, content: { sheetAction in
                        // display the sheet
                        switch sheetAction {
                            case .add:
                                AddBudgetCategoryView()
                            case .edit(_):
                                AddBudgetCategoryView()
                        }
                    })
    }
    
    private func saveChanges() {
        do {
            try viewContext.save()
        } catch  {
            print("There was an error saving the deletion: \(error.localizedDescription)")
        }
    }
    
    private func editBudgetCategory(budgetCategory: BudgetCategory) {
        sheetAction = .edit(budgetCategory)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}
