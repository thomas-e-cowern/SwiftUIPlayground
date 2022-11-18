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
    
    @Published var messages: [MessageViewModel] = []
    
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
    
    func registerUpdatesForRoom(room: RoomViewModel) {
        
        db.collection("rooms")
            .document(room.roomId)
            .collection("messages")
            .order(by:  "messageDate", descending: false)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error in registerUpdatesForRoom: \(error.localizedDescription)")
                } else {
                    if let snapshot = snapshot {
                        let messages: [MessageViewModel] = snapshot.documents.compactMap { doc in
                            guard var message: Message = try? doc.data(as: Message.self) else {
                                return nil
                            }
                            message.id = doc.documentID
                            return MessageViewModel(message: message)
                        }
                        
                        self.messages = messages
                    }
                }
            }
        
    }
    
}
