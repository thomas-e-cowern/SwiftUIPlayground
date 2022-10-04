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
        
        clearForm()
        
        if email.isEmpty {
            loginFormError.email = "Email is required"
        } else if !email.isValidEmail {
            loginFormError.email = "Email is not in the correct format"
        }
        
        if password.isEmpty {
            loginFormError.password = "Password is required"
        }
        return loginFormError.email.isEmpty && loginFormError.password.isEmpty
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            if !loginFormError.email.isEmpty {
                Text(loginFormError.email)
                    .font(.caption)
            }
            SecureField("Password", text: $password)
            if !loginFormError.password.isEmpty {
                Text(loginFormError.password)
                    .font(.caption)
            }
            Button("Login") {
                if isFormValid {
                    // submit form
                }
            }
        }
    }
    
    private func clearForm() {
        loginFormError = LoginFormError()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
