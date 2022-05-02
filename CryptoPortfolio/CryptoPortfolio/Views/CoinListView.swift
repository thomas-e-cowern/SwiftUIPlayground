//
//  CoinListView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/27/22.
//

import SwiftUI

struct CoinListView: View {
    
    var coin: Coin
    var favoriteCoinsArray = CoinContoller.shared.favoriteCoinsArray
    
    var body: some View {
        HStack (alignment: .center) {
            VStack (spacing: 2) {
                ZStack {
                    Image("generic")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Image(coin.symbol.lowercased())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .padding(.leading, 20)
                .shadow(radius: 15)

                
            }
            
            VStack (alignment: .trailing) {
                Button {
                    // more to come
                    print("pressed: \(coin.name)")
                    CoinContoller.shared.addCoinToFavs(coin: coin)
                    print("👉 coinListView Button: \(favoriteCoinsArray)")
                    CoinContoller.shared.loadData()
                    
                } label: {
                    
                    if favoriteCoinsArray.contains(coin.symbol) {
                        Image(systemName: "heart.fill")
                    } else {
                        Image(systemName: "heart")
                    }
                }
            }
            
            VStack (alignment: .leading) {
                Text(coin.symbol)
            }
            .frame(width: 60)
            .padding()
            .shadow(radius: 15)
            
            VStack (alignment: .leading) {
                Text("\(coin.priceAsDouble())")
            }
            .shadow(radius: 15)
            
            Spacer()
        }
    }
}


