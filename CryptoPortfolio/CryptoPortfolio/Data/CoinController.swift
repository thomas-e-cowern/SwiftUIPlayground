//
//  CoinController.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/30/22.
//

import Foundation

class CoinContoller: ObservableObject {
    
    static let shared = CoinContoller()
    
    static let coinUrlString = "https://api.coincap.io/v2/assets?&limit=10"
    
    // MARK:  Fetch Coin Prices
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
    
    func coinHistoryFetch2 (id: String, completion: @escaping ([CoinHistory]?) -> Void) {
        
        let coinName = id.replacingOccurrences(of: " ", with: "-")

        let historyUrlString = "https://api.coincap.io/v2/assets/\(coinName)/history?interval=d1"
        
        guard let url = URL(string: historyUrlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
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
            
            do {
                let jsonHistory = try JSONDecoder().decode(CoinHistoryData.self, from: data)
                
                let history = jsonHistory.data
                completion(history)

            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    
}

