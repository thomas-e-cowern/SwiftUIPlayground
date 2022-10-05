//
//  ContentView.swift
//  MVVMFormValidation
//
//  Created by Thomas Cowern on 10/5/22.
//

import SwiftUI

struct LoginState {
    var email: String = ""
    var password: String = ""
    var emailError: LoginError?
    var passwordError: LoginError?
    
    mutating func clearErrors() {
        errors.removeAll()
    }
    
    mutating func isValid() -> Bool {
        
        clearErrors()
        
        if email.isEmpty {
            emailError = LoginError.emailIsEmpty
        } else if !email.isValidEmail {
            emailError = LoginError.emailInvalid
        }
        
        if password.isEmpty {
            emailError = LoginError.passwordEmpty
        }
        
        return passwordError == nil && emailError == nil
    }
}

struct ContentView: View {
    
    @State private var loginState = LoginState()
    
    var body: some View {
        Form {
            TextField("Email", text: $loginState.email)
                .textInputAutocapitalization(.never)
            Text(loginState.emailError?.localizedDescription ?? "")
            SecureField("Password", text: $loginState.password)
            
            Button("Login") {
                if loginState.isValid() {
                    // submit form
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
