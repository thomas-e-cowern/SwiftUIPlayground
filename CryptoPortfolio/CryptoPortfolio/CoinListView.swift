//
//  CoinListView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/27/22.
//

import SwiftUI

struct CoinListView: View {
    
    var coin: Coin
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 2) {
                Image(coin.symbol.lowercased())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 5)
                HStack {
                    Text(coin.name)
                    Text(coin.symbol)
                }
            }
        }
    }
}


