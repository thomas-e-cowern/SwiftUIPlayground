//
//  CoinData.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/25/22.
//

import Foundation
import SwiftUI

struct Coin {
    var symbol: String
    var image: UIImage
    var price: Double
    var amount: Double
    var historicalData = [Double]()
}
