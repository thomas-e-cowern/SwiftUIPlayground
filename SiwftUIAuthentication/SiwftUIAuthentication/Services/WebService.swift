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

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}

struct LoginResponseBody: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}

class WebService {
    
    func getAllAccounts(token: String, completion: @escaping (Result<[Account], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://four-harvest-hovercraft.glitch.me/accounts") else {
            print("Invalid URL in getAllAccounts")
            completion(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        
        request.addValue(token, forHTTPHeaderField: "authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Invalid Data in getAllAccounts")
                completion(.failure(.noData))
                return
            }
            
//            print("Response: \(response)")
            guard let accounts = try? JSONDecoder().decode([Account].self, from: data) else {
                print("Decoding error in getAllAccounts")
                completion(.failure(.decodingError))
                return
            }
            
            completion(.success(accounts))
        }
        .resume()
        
    }
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "https://four-harvest-hovercraft.glitch.me/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "Bad Data")))
                return
            }
            
            guard let loginRespons = try? JSONDecoder().decode(LoginResponseBody.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginRespons.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
            
        }.resume()
        
    }
    
}
