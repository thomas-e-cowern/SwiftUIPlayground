//
//  MessageListViewModel.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/18/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct messageViewState {
    let message: String
    let roomId: String
    let username: String
}

class MessageListViewModel: ObservableObject {
    
    @Published var message: [MessageViewModel] = []
    
    let db = Firestore.firestore()
    
   
    
}
