//
//  RegisterViewModel.swift
//  FungiFinder
//
//  Created by Thomas Cowern on 11/15/22.
//

import Foundation
import Firebase

class RegisterViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    
    func register(completion: @escaping () -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error  in
            if let error = error {
                print("Error in register: \(error.localizedDescription)")
            } else {
                completion()
            }
        }
    }
    
}
