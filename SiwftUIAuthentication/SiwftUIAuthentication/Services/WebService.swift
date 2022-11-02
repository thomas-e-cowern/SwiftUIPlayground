//
//  WebService.swift
//  SiwftUIAuthentication
//
//  Created by Thomas Cowern on 11/2/22.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

class WebService {
    
    func login(username: String, password: String, completion: @escaping Result<String, AuthenticationError>) -> Void {
        
    }
    
}
