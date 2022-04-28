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
                ZStack {
                    Image("coin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 5)
                }
                .padding(.leading, 20)
                .frame(width: 45)
                
            }
            VStack (alignment: .leading) {
                Text(coin.name)
//                Text("Symbol: \(coin.symbol)")
            }
            .padding()
            
            VStack (alignment: .leading) {
                Text("Price: $\(coin.priceAsDouble())")
            }
        
            
            
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}


