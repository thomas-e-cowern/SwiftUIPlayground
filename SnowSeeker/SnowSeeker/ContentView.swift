//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Thomas Cowern New on 4/13/22.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    
    @State private var selectedUser: User? = nil
    @State private var isShowingAlert = false
    
    var body: some View {
        Text("Hello World")
            .padding()
            .onTapGesture {
                selectedUser = User()
            }
            .sheet(item: $selectedUser) { user in
                Text(user.id)
            }
        Text("Alert Me")
            .onTapGesture {
                selectedUser = User()
                isShowingAlert.toggle()
            }
            .alert("Welcome", isPresented: $isShowingAlert, presenting: selectedUser) { user in
                Button(user.id) {
                    
                }
            }
        
        
        
        
//        NavigationView {
//            NavigationLink {
//                Text("New Secondary")
//            } label: {
//                Text("Hello World")
//            }
//            .navigationTitle("Primary")
//
//            Text("Secondary")
//
//            Text("Tertiary")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
