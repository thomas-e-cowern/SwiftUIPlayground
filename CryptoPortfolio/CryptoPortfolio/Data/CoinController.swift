//
//  CoinController.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/30/22.
//

import Foundation

class CoinContoller: ObservableObject {
    
    static let coinUrlString = "https://api.coincap.io/v2/assets"
    
    static func fetchCoinPrices (completion: @escaping ([Coin]?) -> Void) {
        
        guard let url = URL(string: coinUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            // If error, call fails immediately
            if let error = error {
                print("😡😡😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            // Check data
            guard let data = data else {
                completion(nil)
                return
            }
            
            // Making the data usable
            do {
                let jsonResult = try JSONDecoder().decode(CoinData.self, from: data)
                let coins = jsonResult.data
                
                // Take your coins
                completion(coins)
            } catch {
                print("😡😡😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                let coinsError = Coin(id: "😡", symbol: "😡", name: "😡", priceUsd: "😡", explorer: "😡")
                completion([coinsError])
                return
            }
        }
        .resume()
    }
    
    
    
    
//    static var shared = CoinContoller()
//
//    @Published var coinsArray: [Coin] = []
//    @Published var favoritesArray: [Coin] = []
//
//    func fetchCoinData () {
//
//        let coinUrlString = "https://api.coincap.io/v2/assets"
//
//        guard let url = URL(string: coinUrlString) else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let jsonResult = try JSONDecoder().decode(CoinData.self, from: data)
//                DispatchQueue.main.async {
//                    print("👉 \(jsonResult.data)")
//                    self.coinsArray = jsonResult.data
//                }
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//    }
}

