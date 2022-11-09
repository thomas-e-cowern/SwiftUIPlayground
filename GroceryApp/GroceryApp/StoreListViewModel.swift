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
    
    init() {
        self.firestoreManager = FirestoreManager()
    }
    
    func getAllStores() {
        firestoreManager.getAllStores { result in
            switch result {
            case .success(let stores):
                if let stores = stores {
                    DispatchQueue.main.async {
                        self.stores = stores .map(StoreViewModel.init)
                    }
                }
            case.failure(let error):
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
