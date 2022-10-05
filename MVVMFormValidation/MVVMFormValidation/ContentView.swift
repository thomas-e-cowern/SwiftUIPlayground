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
    
    mutating func isValid() -> Bool {
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
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
            
            Button("Login") {
                    // submit form
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
