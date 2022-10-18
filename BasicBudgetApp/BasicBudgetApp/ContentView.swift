//
//  ContentView.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var budgetCategoryResults: FetchedResults<BudgetCategory>
    @State private var isPresented: Bool = false
    
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
                BudgetListView(budgetCategoryResults: budgetCategoryResults)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add a Category"){
                        // Add category
                        isPresented = true
                    }
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            AddBudgetCategoryView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
