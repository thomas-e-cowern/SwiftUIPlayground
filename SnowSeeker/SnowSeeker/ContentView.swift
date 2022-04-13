//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Thomas Cowern New on 4/13/22.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Thomas Cowern")
            Text("Country: USA")
            Text("Pets: Lily 😥")
        }
        .font(.title)
    }
}

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
//    @State private var selectedUser: User? = nil
    @State private var layoutVertically = true
    
    var body: some View {

        if sizeClass == .compact {
            VStack(content: UserView.init)
            } else {
                HStack {
                    UserView()
                }
            }

        
        
        
        
//            .padding()
//            .onTapGesture {
//                selectedUser = User()
//            }
//            .sheet(item: $selectedUser) { user in
//                Text(user.id)
//            }
//        Text("Alert Me")
//            .onTapGesture {
//                selectedUser = User()
//                isShowingAlert.toggle()
//            }
//            .alert("Welcome", isPresented: $isShowingAlert, presenting: selectedUser) { user in
//                Button(user.id) {
//
//                }
//            }
        
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
