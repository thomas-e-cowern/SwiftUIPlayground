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
}

struct CoinData: Codable {
    let data: [Coin]
}
