//
//  OwnedCoins.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 5/3/22.
//

import Foundation

class OwnedCoins: ObservableObject {
//    private var ownedCoins: Set<String>
    private let saveKey = "ownedCoins"
    private var ownedCoins: [String: Double]
    
    init () {
        ownedCoins = [:]
//        amountOwned = [:]
    }
    
    func loadOwnedCoins () {
        print("inside load in owned coins")
        DispatchQueue.main.async {
             if let defaults = UserDefaults(suiteName: "group.MobileSoftware.Services.CryptoPortfolio") {
                 if let data = defaults.data(forKey: self.saveKey) {
                     let decoder = JSONDecoder()
                     if let jsonUserFavorites = try? decoder.decode([String:Double].self, from: data) {
                         print("😀 jsonUserFavorites: \(jsonUserFavorites)")
                         self.ownedCoins = jsonUserFavorites
                         print("👉 load Data: \(self.ownedCoins)")
                     }
                 } else {
                     print("Problem with data inside owned coins")
                 }
             }
         }
    }
    
    func contains(_ coin: Coin) -> Bool {
        ownedCoins.keys.contains(coin.id)
    }
    
    func add(_ coin: Coin, _ amount: Double) {
        objectWillChange.send()
        ownedCoins.updateValue(amount, forKey: coin.id)
//        ownedCoins.insert(coin.id)
        save()
    }
    
    func remove(_ coin: Coin) {
        objectWillChange.send()
        ownedCoins.removeValue(forKey: coin.id)
//        ownedCoins.remove(coin.id)
        save()
    }
    
    func save() {
        DispatchQueue.main.async {
            print("😀😀😀 Inside ownded coins save")
            if let defaults = UserDefaults(suiteName: "group.MobileSoftware.Services.CryptoPortfolio") {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(self.ownedCoins) {
                    defaults.setValue(encoded, forKey: self.saveKey)
                    defaults.synchronize()
                }
            }
        }
    }
}
