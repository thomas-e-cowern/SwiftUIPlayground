//
//  Network.swift
//  GuessTheFlag
//
//  Created by Thomas Cowern New on 3/4/22.
//

import Foundation

class Network {
    func getCountries (completion: @escaping (Result<[Country], Error>) -> Void) {
        guard let url = URL(string: "https://flagcdn.com/en/codes.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            
            do {
                
                let countries = try! JSONDecoder().decode([Country].self, from: data!)
                completion(.success(countries))
                print(countries)
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }
}
