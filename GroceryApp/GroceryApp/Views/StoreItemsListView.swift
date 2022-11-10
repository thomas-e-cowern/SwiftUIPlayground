//
//  StoreItemsListView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/9/22.
//

import SwiftUI
import Combine

struct StoreItemsListView: View {
    
    @State var store: StoreViewModel
    @State var cancellable: AnyCancellable?
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
        .onAppear {
            cancellable = storeItemLVModel.$store.sink { value in
                if let value = value {
                    store = value
                }
            }
        }
    }
}

struct StoreItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemsListView(store: StoreViewModel(store: Store(name: "Test", address: "123 Test Ave")))
    }
}
