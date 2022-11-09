//
//  StoreListViewModel.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/9/22.
//

import Foundation

class StoreListViewModel: ObservableObject {
    
    private var firestoreManager: FirestoreManager
    @Published var stores: [StoreViewModel] = []
    
    init(firestoreManager: FirestoreManager) {
        self.firestoreManager = firestoreManager
    }
    
    func getAllStores() {
        firestoreManager.getAllStores { result in
            switch result {
            case .success(var stores):
                if let stores = stores {
                    self.stores = stores .map(StoreViewModel.init)
                }
            case.failure(var error):
                print("Error in getAllStores(): \(error.localizedDescription)")
            }
        }
    }
    
}


struct StoreViewModel {
    
    let store: Store
    
    var storeId: String {
        store.id ?? ""
    }
    
    var name: String {
        store.name
    }
    
    var address: String {
        store.address
    }
    
}
