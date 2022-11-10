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
            
            List(storeItemLVModel.storeItems, id:\.name) { item in
                Text(item.name)
            }
        }
        .onAppear {
            storeItemLVModel.getStoreItemsBy(storeId: store.storeId)
        }
    }
}

struct StoreItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemsListView(store: StoreViewModel(store: Store(name: "Test", address: "123 Test Ave")))
    }
}
