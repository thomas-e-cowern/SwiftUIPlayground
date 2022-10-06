//
//  ContentView.swift
//  VMFormSummary
//
//  Created by Thomas Cowern on 10/6/22.
//

import SwiftUI

enum LoginError: LocalizedError {
    case emailIsEmpty
    case invalidEmail
    case passwordIsEmpty
    
    var errorDescription: String? {
        switch self {
        case .emailIsEmpty:
            return "You must provide an email"
        case .invalidEmail:
            return "You must provide a valid email"
        case .passwordIsEmpty:
            return "You must provide a password"
        }
    }
}

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var isValid: Bool {
        return false
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            TextField("Password", text: $password)
            
            Button("Login") {
                if isValid {
                    print("This is valid")
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
