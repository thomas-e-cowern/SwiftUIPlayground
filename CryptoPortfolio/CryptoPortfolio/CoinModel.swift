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
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        if let price = Double(priceUsd) {
            let roundPrice = round(price * 100) / 100
            if let formattedPrice = formatter.string(from: roundPrice as NSNumber) {
//                print("👉 \(formattedPrice )")
                return formattedPrice
            }
        }
        return "0.0"
    }
}

struct CoinData: Codable {
    let data: [Coin]
}

class CoinList: ObservableObject {
    @Published var coinsList = [Coin]()
}
