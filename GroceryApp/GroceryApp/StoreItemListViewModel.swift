//
//  StoreItemListViewModel.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/9/22.
//

import Foundation

class StoreItemListViewModel: ObservableObject {
    
    private var firestoreManager: FirestoreManager
    
    var groceryItemName: String = ""
    @Published var store: StoreViewModel?
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func addItemsToStore(storeId: String) {
        firestoreManager.updateStore(storeId: storeId, values: ["items": [groceryItemName]]) { result in
            
            switch result {
            case .success(let store):
                if let model = store {
                    self.store = StoreViewModel(store: model)
                }
            case .failure(let error):
                print("Error in addItemsToStore: \(error.localizedDescription)")
            }
            
        }
    }
    
}
