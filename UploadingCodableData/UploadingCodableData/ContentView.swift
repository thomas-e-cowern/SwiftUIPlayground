//
//  ContentView.swift
//  UploadingCodableData
//
//  Created by Thomas Cowern New on 8/12/22.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    var body: some View {
        Button("Send Data") {
            let movies = ["The Lord of the Rings", "Elizabeth"]
            let cate = MovieStar(name: "Cate Blanchett", movies: movies)
            let url = URL(string: "https://reqres.in/api/users")!
            
            self.upload(cate, to: url)
        }
    }
    
//    func upload(_ data: MovieStar, to url: URL) {
//        let encoder = JSONEncoder()
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? encoder.encode(data)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                let result = String(decoding: data, as: UTF8.self)
//                print(result)
//            } else if let error = error {
//                print(error.localizedDescription)
//            } else {
//                print("There was an unidentified error")
//            }
//        }.resume()
//    }
    
    func upload<Input: Encodable, Output: Decodable>(_ data: Input, to url: URL, httpMethod: String = "POST", contentType: String = "application/json", completion: @escaping (Result<Output, UploadError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")

        let encoder = JSONEncoder()
        request.httpBody = try? encoder.encode(data)

        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Output.self, decoder: JSONDecoder())
            .map(Result.success)
            .catch { error -> Just<Result<Output, UploadError>> in
                error is DecodingError
                    ? Just(.failure(.decodeFailed))
                    : Just(.failure(.uploadFailed))
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: completion)
            .store(in: &requests)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Testing....")
    }
}
