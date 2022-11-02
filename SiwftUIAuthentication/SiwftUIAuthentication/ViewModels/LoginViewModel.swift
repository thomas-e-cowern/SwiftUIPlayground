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
    @Published var isAuthenticated: Bool = false
    
    func login() {
        
        let defaults = UserDefaults.standard
        
        WebService().login(username: username, password: password) { result in
            switch result {
            case .success(let token):
                defaults.set(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print("Error in login: \(error.localizedDescription)")
            }
        }
    }
    
}
