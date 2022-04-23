//
//  GetDataDTO.swift
//  CoreDataCombine
//
//  Created by Thomas Cowern New on 4/23/22.
//

import Foundation

struct GetDataDTO : Decodable {
    let status: String
    let data: CryptoData
}

struct CryptoData : Decodable {
    let coins: [Coin]
}

struct Coin: Decodable, Hashable {
    let name: String
    let price: String
    let symbol: String
    let marketCap: String
    let iconUrl: String
}
