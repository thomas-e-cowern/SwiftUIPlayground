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
            VStack (spacing: 2) {
                ZStack {
                    Image("coin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .padding(.leading, 20)
                .shadow(radius: 15)

                
            }
            VStack (alignment: .leading) {
                Text(coin.symbol)
            }
            .frame(width: 60)
            .padding()
            .shadow(radius: 15)
            
            VStack (alignment: .leading) {
                Text("Price: \(coin.priceAsDouble())")
            }
            .shadow(radius: 15)

            Spacer()
        }
    }
}


