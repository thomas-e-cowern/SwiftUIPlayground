//
//  UsersViewModel.swift
//  NetworkingTest
//
//  Created by Thomas Cowern on 9/8/22.
//

import Foundation

final class UsersViewModel: ObservableObject {
    func fetchUsers() {
        
        let userUrlString = "https://jsonplaceholder.typicode.com/users"
        if let url = URL(string: userUrlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("There was an error in the network call: \(error.localizedDescription)")
                } else {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                }
            }.resume()
        }
    }
}
