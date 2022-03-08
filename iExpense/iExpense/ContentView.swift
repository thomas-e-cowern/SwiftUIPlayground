//
//  ContentView.swift
//  iExpense
//
//  Created by Thomas Cowern New on 3/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var isAddViewShowing: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                        .padding()
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .toolbar {
                Button {
//                    let expense = ExpenseItem(name: "Test", type: "personal", amount: 5)
//                    expenses.items.append(expense)
                    isAddViewShowing.toggle()
                } label: {
                     Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isAddViewShowing) {
                AddView(expenses: expenses)
            }

        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
