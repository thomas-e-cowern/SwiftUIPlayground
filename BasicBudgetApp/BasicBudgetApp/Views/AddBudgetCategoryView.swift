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
    @State private var total: Double = 0
    @State private var messages: [String] = []
    
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
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // Things will be saved to core data
                    }
                }
            }
        }
    }
}

struct AddBudgetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetCategoryView()
    }
}
