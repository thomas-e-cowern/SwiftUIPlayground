//
//  ContentView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    
    let url = URL(string: "https://api.coincap.io/v2/assets")
    @State private var coinsArray: [Coin] = []
    @EnvironmentObject var coins: CoinList
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if coinsArray.count == 0 {
                        Text("Loading...")
                            .font(.system(.headline))
                    } else {
                        ForEach(coinsArray) { coin in
                            NavigationLink (destination: Text(coin.name)) {
                                CoinListView(coin: coin)
                            }
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .onAppear {
                fetch()
            }
            .navigationTitle("Crypto Portfolio")
        }
            
//        Text("Test")
//            .onAppear {
//                fetch()
//            }
    }
    
   func fetch () {
        URLSession.shared.request(url: url, expecting: CoinData.self) { result in
            switch result {
            case .success(let coins):
               
                let coins = coins.data
                
                for coin in coins {
//                    print("👉 \(coin)")
                    coinsArray.append(coin)
                }
                
//                print(coinsArray)
               
            case.failure(let error):
                print(error)
            }
        }
    }
}

extension URLSession {
    
    // Enums for possible errors
    enum CustomError: Error {
        case invalidUrl
        case invalidData
    }
    
    // Request with generic
    func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        // Check for invalid url
        guard let  url = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        
        // Check for data error
        let task = dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            // Decode the results
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
