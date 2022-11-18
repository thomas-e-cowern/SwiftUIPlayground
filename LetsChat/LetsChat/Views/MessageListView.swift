//
//  MessageListView.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/16/22.
//

import SwiftUI

struct MessageListView: View {
    
    @StateObject private var messageListVM = MessageListViewModel()
    
    @State private var message: String = ""
    @AppStorage("username") private var username = ""
    
    let room: RoomViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { scrollView in
                    VStack {
                       
                    }.onAppear(perform: {
                            
                          
                    })
                }
            }
            
            Spacer()
            
            HStack {
                TextField("Write message here", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                   
                    sendMessage()
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                })
            }.padding()
           
            
            .background(Color(#colorLiteral(red: 0.9483042359, green: 0.9484629035, blue: 0.9482833743, alpha: 1)))
        }
        .navigationTitle(room.name)
        .onAppear(perform: {
            
        })
    }
    
    func sendMessage() {
        
        let messageVS = MessageViewState(message: message, roomId: room.roomId, username: username)
        
        messageListVM.sendMessage(msg: messageVS) {
            message = ""
        }
        
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView(room: RoomViewModel(room: Room(name: "Testing", description: "Testing description")))
    }
}
