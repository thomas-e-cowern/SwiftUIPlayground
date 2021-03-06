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
    let explorer: String?
    
    func priceAsDouble () -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        if let price = Double(priceUsd) {
            let roundPrice = round(price * 100) / 100
            if let formattedPrice = formatter.string(from: roundPrice as NSNumber) {
                return formattedPrice
            }
        }
        return "0.0"
    }
    
    func checkForExplorer () -> String {
        if let explorer = explorer {
            return explorer
        } else {
            return "https://api.coincap.io" 
        }
    }
}

struct CoinData: Codable {
    let data: [Coin]
}

struct CoinHistoryData: Codable {
    let data: [CoinHistory]
}

struct CoinHistory: Codable {
    let priceUsd: String
    let time: Int
    let date: String
    
    func historyPriceAsDouble () -> Double {
        
        if let priceAsDouble = Double(priceUsd) {
                return priceAsDouble
        }
        return 0.0
    }
}

class CoinList: ObservableObject {
    @Published var coinsList = [Coin]()
}
