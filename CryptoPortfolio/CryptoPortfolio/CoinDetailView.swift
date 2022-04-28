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
        List() {
            Text(coin.name)
            Text(coin.symbol)
            Text(coin.priceAsDouble())
            if coin.checkForExplorer() != "https://api.coincap.io" {
                Link("Check out \(coin.name)", destination: URL(string: coin.checkForExplorer())!)
            } else {
                Link("Check out Coincap...", destination: URL(string: coin.checkForExplorer())!)
            }
        }
        
        
    }
}

