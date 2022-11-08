//
//  AddStoreVIewModel.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/8/22.
//

import Foundation

class AddStoreViewModel: ObservableObject {
    
    private var firestoreManager: FirestoreManager
    
    @Published var saved: Bool = false
    @Published var message: String = ""
    
    var name: String = ""
    var address: String = ""
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func save() {
        let store = Store(name: name, address: address)
        firestoreManager.save(store: store) { result in
            switch result {
            case .success(let store):
                self.saved = store == nil ? false : true
            case .failure(_):
                self.message = Constants.Messages.storeSavedFailure
            }
        }
    }
}
