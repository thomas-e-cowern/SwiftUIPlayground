//
//  MessageViewModel.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/18/22.
//

import Foundation

struct MessageViewModel {
    
    let message: Message
    
    var messageText: String {
        message.text
    }
    
    var username: String {
        message.username
    }
    
    var messageId: String {
        message.id ?? ""
    }
    
}
