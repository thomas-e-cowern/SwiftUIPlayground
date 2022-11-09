//
//  StoreItemsListView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/9/22.
//

import SwiftUI

struct StoreItemsListView: View {
    
    let store: StoreViewModel
    @StateObject private var storeItemLVModel = StoreItemListViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter Item Name", text: $storeItemLVModel.groceryItemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save") {
                storeItemLVModel.addItemsToStore(storeId: store.storeId)
            }
            
            List(store.items, id: \.self) { item in
                Text(item)
            }
        }
    }
}

struct StoreItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemsListView(store: StoreViewModel(store: Store(name: "Test", address: "123 Test Ave")))
    }
}
