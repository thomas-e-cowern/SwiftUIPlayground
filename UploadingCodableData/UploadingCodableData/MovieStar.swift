//
//  MovieStar.swift
//  UploadingCodableData
//
//  Created by Thomas Cowern New on 8/12/22.
//

import Foundation

struct MovieStar: Codable {
    let name: String
    let movies: [String]
    
    func upload(_ data: MovieStar, to url: URL) {
        let encoder = JSONEncoder()
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? encoder.encode(data)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let result = String(decoding: data, as: UTF8.self)
                print(result)
            } else if let error = error {
                print(error.localizedDescription)
            } else {
                print("There was an unidentified error")
            }
        }.resume()
    }
}
