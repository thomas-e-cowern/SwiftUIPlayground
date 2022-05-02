//
//  CoinController.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/30/22.
//

import Foundation

class CoinContoller: ObservableObject {
    
    static let shared = CoinContoller()
    
    var favoriteCoins: [Coin] = []
    var favoriteCoinsArray: [String] = []
    
    static let coinUrlString = "https://api.coincap.io/v2/assets"
    
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
    
    // MARK:  Save data to user defaults
    func saveData () {
        DispatchQueue.global().async {
            if let defaults = UserDefaults(suiteName: "group.MobileSoftware.Services.CryptoPortfolio") {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(self.favoriteCoins) {
                    defaults.setValue(encoded, forKey: "favoriteCoins")
                    defaults.synchronize()
                }
            }
        }
    }
    
    // MARK:  Load data from user defaults
    func loadData () {
        print("inside load")
        DispatchQueue.global().async {
            if let defaults = UserDefaults(suiteName: "group.MobileSoftware.Services.CryptoPortfolio") {
                if let data = defaults.data(forKey: "favoriteCoins") {
                    print(data)
                    let decoder = JSONDecoder()
                    if let jsonUserFavorites = try? decoder.decode([Coin].self, from: data) {
                        self.favoriteCoins = jsonUserFavorites
                        print("👉 load Data: \(self.favoriteCoins)")
                    }
                } else {
                    print("Problem with data")
                }
            }
        }
    }
    
    // MARK:  Add to favorites
    func addCoinToFavs (coin: Coin) {
        loadData()
        favoriteCoinsArray.append(coin.symbol)
        saveData()
        print(favoriteCoinsArray)
    }
}

