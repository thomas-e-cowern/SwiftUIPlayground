//
//  RoomListView.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/16/22.
//

import SwiftUI

struct RoomListView: View {
    
    @State private var isPresented: Bool = false
    @State private var path: [Bool] = []
    @State private var isActive: Bool = false
    
    @StateObject private var roomListVM = RoomListViewModel()
    
    var body: some View {
        NavigationStack (path: $path) {
            VStack {
                List(roomListVM.rooms, id: \.roomId) { room in
                    NavigationLink {
                        MessageListView()
                    } label: {
                        RoomRowView(room: room)
                    }

                }
                .listStyle(.grouped)
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.green)
                    }
                }
            })
            .navigationTitle("Rooms")
            .sheet(isPresented: $isPresented) {
                AddRoomView()
            }
            .onAppear {
                roomListVM.getAllRooms()
            }
        }
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
    }
}
