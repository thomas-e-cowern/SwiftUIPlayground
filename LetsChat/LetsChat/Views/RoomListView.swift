//
//  RoomListView.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/16/22.
//

import SwiftUI

struct RoomListView: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
                // Do somthing...
            }
        }
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
    }
}
