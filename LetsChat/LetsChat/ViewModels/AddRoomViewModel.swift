//
//  AddRoomViewModel.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/16/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class AddRoomViewModel: ObservableObject {
    
    var name: String = ""
    var description: String = ""
    var db = Firestore.firestore()
    
    func createRoom(completion: @escaping() -> Void) {
        
        let room = Room(name: name, description: description)
        
        do {
          
          _ = try db.collection("rooms")
              .addDocument(from: room, encoder: Firestore.Encoder()) { (error) in
                  if let error = error {
                      print(error.localizedDescription)
                  } else {
                      completion()
                  }
              }
          } catch let error {
              print(error.localizedDescription)
          }
    }
}
