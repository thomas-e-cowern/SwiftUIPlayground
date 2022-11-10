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
    
    var storeItemViewState = StoreItemViewState()
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func addItemToStore(storeId: String, completion: @escaping (Error?) -> Void) {
        
        
        
    }
    
//    func addItemsToStore(storeId: String) {
//        firestoreManager.updateStore(storeId: storeId, values: ["items": [groceryItemName]]) { result in
//
//            switch result {
//            case .success(let storeModel):
//                if let model = storeModel {
//                    self.store = StoreViewModel(store: model)
//                }
//            case .failure(let error):
//                print("Error in addItemsToStore: \(error.localizedDescription)")
//            }
//
//        }
//    }
    
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
    
}
