//
//  ContentView.swift
//  SiwftUIAuthentication
//
//  Created by Thomas Cowern on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        VStack {
            Form {
                HStack {
                    Spacer()
                    Image(systemName: "lock.fill")
                }
                TextField("Username", text: $loginVM.username)
                TextField("Password", text: $loginVM.password)
                HStack {
                    Spacer()
                    Button("Login") {
                        
                    }
                    Button("Logoout") {
                        
                    }
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                Spacer()
                
                Button("Get Accounts") {
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
