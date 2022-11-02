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

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}

class WebService {
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "https://four-harvest-hovercraft.glitch.me/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        
        
    }
    
}
