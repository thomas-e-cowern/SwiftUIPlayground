//
//  CoinData.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/25/22.
//

import Foundation
import SwiftUI

struct Coin: Codable, Identifiable {
    var id: String
    var symbol: String
    var image: String
    var price: Double
    var amount: Double
    var historicalData: [Double]
}

struct CoinsData: Codable {
    var coins: [Coin]
    static let example = (Bundle.main.decode("TestCryptoData.json") as [Coin])[0]
}

struct PriceSymbol: Decodable {
    var symbol: String
//    var price: PriceData
}

struct PriceData: Decodable {
    var currency: String
    var price: Double
    
    var coins: [Coin]
}

