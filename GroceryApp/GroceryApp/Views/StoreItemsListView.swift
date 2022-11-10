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
            
            TextField("Enter Item Price", text: $storeItemLVModel.storeItemViewState.price)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Item Quantity", text: $storeItemLVModel.storeItemViewState.quantity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save") {
                storeItemLVModel.addItemToStore(storeId: store.storeId) { error in
                    if error == nil {
                        storeItemLVModel.getStoreItemsBy(storeId: store.storeId)
                    }
                }
            }
            
            List {
                ForEach(storeItemLVModel.storeItems, id: \.storeItem.id) { item in
                    Text(item.name)
                }
                .onDelete(perform: deleteStoreItem)
            }
        }
        .onAppear {
            storeItemLVModel.getStoreItemsBy(storeId: store.storeId)
        }
    }
    
    private func deleteStoreItem(as indexSet: IndexSet) {
        indexSet.forEach { index in
            let storeItem = storeItemLVModel.storeItems[index]
            storeItemLVModel.deleteStoreItem(storeId: store.storeId, storeItemId: storeItem.storeItemId)
        }
    }
}

struct StoreItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemsListView(store: StoreViewModel(store: Store(name: "Test", address: "123 Test Ave")))
    }
}
