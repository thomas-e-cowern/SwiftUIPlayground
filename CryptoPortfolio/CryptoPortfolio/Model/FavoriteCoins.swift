//
//  FavoriteCoins.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 5/2/22.
//

import Foundation

class FavoriteCoins: ObservableObject {
    private var favoriteCoins: Set<String>
    private let saveKey = "favoriteCoins"
    
    init () {
        
        favoriteCoins = []
    }
    
    func loadFavorites () {
        print("inside load")
        DispatchQueue.main.async {
             if let defaults = UserDefaults(suiteName: "group.MobileSoftware.Services.CryptoPortfolio") {
                 if let data = defaults.data(forKey: self.saveKey) {
                     let decoder = JSONDecoder()
                     if let jsonUserFavorites = try? decoder.decode(Set<String>.self, from: data) {
                         print("😀 jsonUserFavorites: \(jsonUserFavorites)")
                         self.favoriteCoins = jsonUserFavorites
                         print("👉 load Data: \(self.favoriteCoins)")
                     }
                 } else {
                     print("Problem with data")
                 }
             }
         }
    }
    
    func contains(_ coin: Coin) -> Bool {
        favoriteCoins.contains(coin.id)
    }
    
    func add(_ coin: Coin) {
        objectWillChange.send()
        favoriteCoins.insert(coin.id)
        save()
    }
    
    func remove(_ coin: Coin) {
        objectWillChange.send()
        favoriteCoins.remove(coin.id)
        save()
    }
    
    func save() {
        DispatchQueue.main.async {
            print("😀😀😀 Inside Save")
            if let defaults = UserDefaults(suiteName: "group.MobileSoftware.Services.CryptoPortfolio") {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(self.favoriteCoins) {
                    defaults.setValue(encoded, forKey: self.saveKey)
                    defaults.synchronize()
                }
            }
        }
    }
}
