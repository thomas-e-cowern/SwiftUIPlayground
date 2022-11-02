//
//  LoginViewModel.swift
//  SiwftUIAuthentication
//
//  Created by Thomas Cowern on 11/2/22.
//

import Foundation
 
class LoginViewModel: ObservableObject {
    
    var username: String = ""
    var password: String = ""
    
    func login() {
        
        WebService().login(username: username, password: password) { result in
            switch result {
            case .success(let token):
                print(token)
            case .failure(let error):
                print("Error in login: \(error.localizedDescription)")
            }
        }
    }
    
}
