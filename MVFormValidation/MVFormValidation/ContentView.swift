//
//  ContentView.swift
//  MVFormValidation
//
//  Created by Thomas Cowern on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var isFormValid: Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
            TextField("Password", text: $password)
            Button("Login") {
                print("Logged IN")
            }.disabled(isFormValid ? false : true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
