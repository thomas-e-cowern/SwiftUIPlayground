//
//  CoinModel.swift
//  DictionaryTest
//
//  Created by Thomas Cowern New on 4/26/22.
//

import Foundation

struct Coin: Hashable, Codable {
    let symbol: String
    let price: CurrentPrice
}

struct CurrentPrice: Hashable, Codable {
    let currency: String
    let price: Double
}
