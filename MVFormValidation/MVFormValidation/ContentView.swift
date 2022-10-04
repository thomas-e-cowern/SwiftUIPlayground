//
//  ContentView.swift
//  MVFormValidation
//
//  Created by Thomas Cowern on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var email: String?
    @State var password: String?
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
            TextField("Password", text: $password)
            Button("Login") {
                
            }.disabled(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(email: "Email", password: "Password")
    }
}
