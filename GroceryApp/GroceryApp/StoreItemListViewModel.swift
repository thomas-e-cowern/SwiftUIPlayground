//
//  StoreItemListViewModel.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/9/22.
//

import Foundation

struct StoreItemViewState {
    var name: String = ""
    var price: String = ""
    var quantity: String = ""
}

class StoreItemListViewModel: ObservableObject {
    
    private var firestoreManager: FirestoreManager
    
    var groceryItemName: String = ""
    @Published var store: StoreViewModel?
    @Published var storeItems: [StoreItemViewModel] = []
    
    var storeItemViewState = StoreItemViewState()
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func addItemToStore(storeId: String, completion: @escaping (Error?) -> Void) {
        
        let storeItem = StoreItem.from(storeItemViewState)
        firestoreManager.updateStore(storeId: storeId, storeItem: storeItem) { result in
            switch result {
                case .success(_):
                    completion(nil)
                case .failure(let error):
                    completion(error)
                }
        }
    }
    
    func getStoreById(storeId: String) {
        firestoreManager.getStoreById(storeId: storeId) { result in
            switch result {
                case .success(let store):
                    if let store = store {
                        self.store = StoreViewModel(store: store)
                    }
                case .failure(let error):
                    print("Error in getStoreById in StoreItemListViewModel: \(error.localizedDescription)")
            }
        }
    }
    
    func getStoreItemsBy(storeId: String) {
        firestoreManager.getStoreItemsBy(storeId: storeId) { result in
            switch result {
                case .success(let items):
                    if let items = items {
                        self.storeItems = items.map(StoreItemViewModel.init)
                    }
                case .failure(let error):
                    print("Error in getStoreById in StoreItemListViewModel: \(error.localizedDescription)")
            }
        }
    }
}
