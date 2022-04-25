//
//  CoinData.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/25/22.
//

import Foundation
import SwiftUI

class CoinData {
    static let shared = CoinData()
    var coins = [Coin]()
    
    private init () {
        let symbols = ["BTC", "ETH", "LTC"]
        
        for symbol in symbols {
            let coin = Coin(symbol: symbol)
            coins.append(coin)
        }
    }
}


class Coin: Identifiable {
    var symbol = ""
    var image = UIImage()
    var price = 0.0
    var amount = 0.0
    var historicalData = [Double]()
    
    init (symbol: String) {
        self.symbol = symbol
        if let image = UIImage(named: symbol) {
            print("Found an image")
            self.image = image
        } else {
            print("No image found")
        }
    }
}
