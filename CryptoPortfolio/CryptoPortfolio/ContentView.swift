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
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if coinsArray.count == 0 {
                        VStack {
                            Text("Loading...")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                    } else {
                        ForEach(coinsArray) { coin in
                            NavigationLink (destination: CoinDetailView(coin: coin)) {
                                CoinListView(coin: coin)
                            }
                        }
                    }
                }
                .navigationTitle("Crypto Portfolio")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            coinsArray = []
                            fetch()
                        } label: {
                            Image(systemName: "repeat.circle.fill")
                        }
                    }
                }
                .onAppear {
                    coinsArray = []
                    fetch()
                }
            }
            
        }
    }
    
   func fetch () {
        URLSession.shared.request(url: url, expecting: CoinData.self) { result in
            switch result {
            case .success(let coins):
               
                let coins = coins.data
                
                for coin in coins {
                    coinsArray.append(coin)
                }
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
