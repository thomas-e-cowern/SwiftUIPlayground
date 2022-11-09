//
//  AddStoreView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/8/22.
//

import SwiftUI

struct AddStoreView: View {
    
    @StateObject private var addStoreVM = AddStoreViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $addStoreVM.name)
                    TextField("Address", text: $addStoreVM.address)
                    HStack {
                        Button("Save") {
                            addStoreVM.save()
                        }.onChange(of: addStoreVM.saved) { newValue in
                            if newValue {
                                dismiss()
                            }
                        }
                    }
                    .centerHorizontally()
                   
                }
                
                
                if addStoreVM.message.isEmpty {
                    Text(addStoreVM.message)
                }
                
            }
            .navigationTitle("Add New Store")
            .navigationBarItems(leading: Button(action: {
                // will do something here
                dismiss()
            }, label: {
                Image(systemName: "xmark")
        }))
        }
    }
}

struct AddStoreView_Previews: PreviewProvider {
    static var previews: some View {
        AddStoreView()
    }
}
