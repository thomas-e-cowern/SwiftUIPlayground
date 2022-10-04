//
//  ContentView.swift
//  MVFormValidation
//
//  Created by Thomas Cowern on 10/4/22.
//

import SwiftUI

struct LoginFormError {
    var email: String = ""
    var password: String = ""
}

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginFormError = LoginFormError()
    
    var isFormValid: Bool {
        return !email.isEmpty && !password.isEmpty && email.isValidEmail
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
            Button("Login") {
                
            }.disabled(!isFormValid)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
