//
//  RoomListViewModel.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/18/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct RoomViewModel {
    
    let room: Room
    
    var name: String {
        room.name
    }
    
    var description: String {
        room.description
    }
    
    var roomId: String {
        room.id ?? ""
    }
}
