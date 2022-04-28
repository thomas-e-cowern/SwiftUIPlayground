//
//  CoinDetailView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/28/22.
//

import SwiftUI

struct CoinDetailView: View {
    
    var coin: Coin
    
    var body: some View {
        Text(coin.name)
        Text(coin.symbol)
        Text(coin.priceAsDouble())
        Text("\(coin.checkForUrl())")
    }
}

