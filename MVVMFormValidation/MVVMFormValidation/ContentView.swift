//
//  ContentView.swift
//  MVVMFormValidation
//
//  Created by Thomas Cowern on 10/5/22.
//

import SwiftUI

enum LoginError: Error, LocalizedError {
    case emailIsEmpty
    case emailInvalid
    case passwordEmpty
    
    var errorDescription: String? {
        switch self {
        case .emailIsEmpty:
            return "Email cannot be empty"
        case .emailInvalid:
            return "Email is not in the correct format"
        case .passwordEmpty:
            return "Passwword cannot be empty"
        }
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
