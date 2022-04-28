//
//  CoinModel.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/27/22.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let priceUsd: String
    
    func priceAsDouble () -> String {
        if let price = Double(priceUsd) {
            let roundPrice = round(price * 100) / 100
            print("👉 \(roundPrice)")
            return String(roundPrice)
        } else {
            return "0.0"
        }
    }
    
    func priceAsDecimal () -> Decimal {
        if let price = Decimal(string: priceUsd) {
            let roundPrice = (price * 100) / 100
            print("👉 \(roundPrice)")
            return roundPrice
        } else {
            return 0.0
        }
    }
}

struct CoinData: Codable {
    let data: [Coin]
}

class CoinList: ObservableObject {
    @Published var coinsList = [Coin]()
}
