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
    
    func priceAsDouble () -> Double {
        if let price = Double(priceUsd) {
//            print("👉 \(price)")
            let roundPrice = round(price * 100) / 100
            print("👉 \(roundPrice)")
            return roundPrice
        }

        return 0.0
//        return Double(price) ?? 0.0
    }
    
    func priceAsDecimal (price: String) -> Decimal {
        if let price = Decimal(string: price) {
//            print("👉 \(price)")

            let decimalPrice = (price * 100.0) / 100.0
            print("👉 \(decimalPrice)")
        }

        return 0.0
//        return Double(price) ?? 0.0
    }
}

struct CoinData: Codable {
    let data: [Coin]
}

class CoinList: ObservableObject {
    @Published var coinsList = [Coin]()
}
