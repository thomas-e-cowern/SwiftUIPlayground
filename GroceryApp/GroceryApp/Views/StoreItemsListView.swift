//
//  StoreItemsListView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/9/22.
//

import SwiftUI

struct StoreItemsListView: View {
    
    var store: StoreViewModel
    @StateObject private var storeItemLVModel = StoreItemListViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter Item Name", text: $storeItemLVModel.storeItemViewState.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Item Name", text: $storeItemLVModel.storeItemViewState.price)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Item Name", text: $storeItemLVModel.storeItemViewState.quantity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save") {
                storeItemLVModel.addItemsToStore(storeId: store.storeId)
                storeItemLVModel.getStoreById(storeId: store.storeId)
            }
            
            if let store = storeItemLVModel.store {
                List(store.items, id: \.self) { item in
                    Text(item)
                }
            }
        }
        .onAppear {
            storeItemLVModel.getStoreById(storeId: store.storeId)
        }
    }
}

struct StoreItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemsListView(store: StoreViewModel(store: Store(name: "Test", address: "123 Test Ave")))
    }
}
