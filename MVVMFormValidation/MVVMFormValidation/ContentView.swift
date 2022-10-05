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
        emailError = nil
        passwordError = nil
    }
    
    mutating func isValid() -> Bool {
        
        clearErrors()
        
        if email.isEmpty {
            emailError = LoginError.emailIsEmpty
        } else if !email.isValidEmail {
            emailError = LoginError.emailInvalid
        }
        
        if password.isEmpty {
            passwordError = LoginError.passwordEmpty
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
            if let emailError = loginState.emailError {
                Text(emailError.localizedDescription)
            }
            
            SecureField("Password", text: $loginState.password)
            if let passwordError = loginState.passwordError {
                Text(passwordError.localizedDescription)
            }
            
            Button("Login") {
                if loginState.isValid() {
                    print("The form has been submitted")
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
