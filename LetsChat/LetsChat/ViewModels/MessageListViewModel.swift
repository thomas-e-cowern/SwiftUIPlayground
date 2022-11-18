//
//  MessageListViewModel.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/18/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct MessageViewState {
    let message: String
    let roomId: String
    let username: String
}

class MessageListViewModel: ObservableObject {
    
    @Published var message: [MessageViewModel] = []
    
    let db = Firestore.firestore()
    
    func sendMessage(msg: MessageViewState, completion: @escaping () -> Void) {
        
        let message = Message(vs: msg)
        
        do {
            try db.collection("rooms")
                .document(message.roomId)
                .collection("messages")
                .addDocument(from: message, encoder: Firestore.Encoder()) { error in
                    if let error = error {
                        print("Error in sendMessage: \(error.localizedDescription)")
                    } else {
                        completion()
                    }
                }
        } catch let error {
            print("Error in do-catch in sendMessage: \(error.localizedDescription)")
        }
    }
    
}
