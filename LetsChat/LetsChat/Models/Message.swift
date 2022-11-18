//
//  Message.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/18/22.
//

import Foundation

struct Message: Codable {
    
    var id: String?
    var text: String = ""
    var username: String = ""
    var roomId: String = ""
    var messageDate = Date()
    
    init(vs: MessageViewState) {
        text = vs.message
        username = vs.username
        roomId = vs.roomId
    }
    
}
