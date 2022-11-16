//
//  ContentView.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    @State private var usernameEntry: String = ""
    @State private var isActive: Bool = false
    @AppStorage("username") private var username = ""
    
    @State private var path: [Bool] = []
      
    var body: some View {
        VStack {
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            TextField("Enter username", text: $usernameEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Enter") {
                
                isActive = true
                username = usernameEntry
                
                if isActive {
                    path.append(isActive)
                }

                
            }
            .navigationDestination(for: Bool.self, destination: { value in
                   RoomListView()
               })
            .buttonStyle(PrimaryButtonStyle())
            
            Spacer()
        }.padding()
            .embedInNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
