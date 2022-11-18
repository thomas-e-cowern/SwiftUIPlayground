//
//  MessageListViewModel.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/18/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageListViewModel: ObservableObject {
    
    @Published var message: [MessageViewModel] = []
    
    let db = Firestore.firestore()
    
    
    
}
