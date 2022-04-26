//
//  CoinModel.swift
//  DictionaryTest
//
//  Created by Thomas Cowern New on 4/26/22.

import Foundation

// MARK: - Welcome
struct CoinData: Codable {
    let data: [Coin]
}

// MARK: - Datum
struct Coin: Codable {
    let id, rank, symbol, name: String?
    let supply,marketCapUsd, volumeUsd24Hr: String?
    let maxSupply: String?
    let priceUsd, changePercent24Hr, vwap24Hr: String?
    let explorer: String?
}

//struct CoinList: Codable {
//    var coins: [Coin] = []
//
//    struct Coin: Codable, Identifiable {
//        let id, rank, symbol, name: String
//        let supply: String
//        let maxSupply: JSONNull?
//        let marketCapUsd, volumeUsd24Hr, priceUsd, changePercent24Hr: String
//        let vwap24Hr: String
//        let explorer: String
//    }
//}
//
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        // No-op
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
////import Foundation
////
////struct Coin: Hashable, Codable {
////    let id: String
////    let symbol: String
////    let name: String
////    let priceUsd: Double
////}
////
////struct CurrentPrice: Hashable, Codable {
////    let currency: String
////    let price: Double
////}
////
////
//struct Data: Codable {
//    let data: [[String: String?]]
//}
