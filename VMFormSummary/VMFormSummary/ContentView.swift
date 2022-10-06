//
//  ContentView.swift
//  VMFormSummary
//
//  Created by Thomas Cowern on 10/6/22.
//

import SwiftUI

enum LoginError: LocalizedError, Identifiable {
    case emailIsEmpty
    case invalidEmail
    case passwordIsEmpty
    
    var id: Int {
        hashValue
    }
    
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
    @State private var errors: [LoginError] = []
    
    var isValid: Bool {
        
        errors.removeAll()
        
        if email.isEmpty {
            errors.append(.emailIsEmpty)
        } else if !email.isValidEmail {
            errors.append(.invalidEmail)
        }
        
        if password.isEmpty {
            errors.append(.passwordIsEmpty)
        }
        
        return errors.isEmpty
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
            
            ValidationSummaryView(errors: errors)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
