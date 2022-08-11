//
//  ContentView.swift
//  CodableNetworking
//
//  Created by Thomas Cowern New on 8/11/22.
//

import SwiftUI

struct User: Decodable {
    var id: UUID
    var name: String
    
    static let `default` = User(id: UUID(), name: "Anonymous")
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
    
    func fetch(_ url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(User.default)
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let user = try decoder.decode(User.self, from: data)
                    print(user)
                } catch {
                    print("There was an error decoding: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
