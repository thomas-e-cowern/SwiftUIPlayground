//
//  LoginViewModel.swift
//  FungiFinder
//
//  Created by Thomas Cowern on 11/15/22.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    
    func login(completion: @escaping () -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error in login: \(error.localizedDescription)")
            } else {
                completion()
            }
        }
        
    }
    
}
