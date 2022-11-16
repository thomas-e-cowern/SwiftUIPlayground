//
//  AddRoomView.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/16/22.
//

import SwiftUI

struct AddRoomView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var addRoomVM = AddRoomViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Form {
                    TextField("Enter name", text: $addRoomVM.name)
                    TextField("Enter description", text: $addRoomVM.description)
                    
                }
                .formStyle(.automatic)
                
                Button("Save") {
                    addRoomVM.createRoom {
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding()
                
                Spacer()
                
            }.navigationTitle("Add New Room")
        }
    }
}

struct AddRoomView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoomView()
    }
}
