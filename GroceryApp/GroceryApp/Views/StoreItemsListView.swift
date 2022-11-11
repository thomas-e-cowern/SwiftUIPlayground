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
    
    @State private var storeItemVS = StoreItemViewState()
    
    var body: some View {
        VStack {
            TextField("Enter Item Name", text: $storeItemVS.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Item Price", text: $storeItemVS.price)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Item Quantity", text: $storeItemVS.quantity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save") {
                storeItemLVModel.addItemToStore(storeId: store.storeId, storeItemVS: storeItemVS) { error in
                    if error == nil {
                        storeItemLVModel.getStoreItemsBy(storeId: store.storeId)
                        storeItemVS = StoreItemViewState()
                    }
                }
            }
            
            List {
                ForEach(storeItemLVModel.storeItems, id: \.storeItem.id) { item in
                    StoreItemsDetailView(storeItem: item)
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
