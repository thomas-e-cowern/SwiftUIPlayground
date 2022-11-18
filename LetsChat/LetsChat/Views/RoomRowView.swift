//
//  RoomRowView.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/18/22.
//

import SwiftUI

struct RoomRowView: View {
    
    let room: RoomViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(room.name)
                .font(.headline)
            Text(room.description)
        }
    }
}

struct RoomRowView_Previews: PreviewProvider {
    static var previews: some View {
        RoomRowView(room: RoomViewModel(room: Room(name: "test room", description: "test description")))
    }
}
