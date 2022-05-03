//
//  CoinListView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/27/22.
//

import SwiftUI

struct CoinListView: View {
    
    var coin: Coin
    
    @EnvironmentObject var favoriteCoins : FavoriteCoins
    
    var body: some View {
        HStack (alignment: .center) {
            VStack (spacing: 2) {
                checkForImage(symbol: coin.symbol.lowercased())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.leading, 10)
            }
            
            VStack (alignment: .trailing) {
                
                if favoriteCoins.contains(coin) {
                    Image(systemName: "heart.fill")
                        .accessibilityLabel("This is a favorite coin")
                        .foregroundColor(.red)
                } else {
                    Image(systemName: "heart")
                        .accessibilityLabel("This is not a favorite coin")
                }
            }
            
            VStack (alignment: .leading) {
                Text(coin.symbol)
            }
            .frame(width: 60)
            .padding()
            
            VStack (alignment: .leading) {
                Text("\(coin.priceAsDouble())")
                    .scaledToFit()
            }
            
            Spacer()
            
            VStack (alignment: .leading) {
                Image(systemName: "chevron.right")
            }
            .padding()
        }
    }
    
    func checkForImage(symbol: String) -> Image {
        let image = (UIImage(named: symbol) ?? UIImage(named: "generic.png"))!
        return Image(uiImage: image)
    }
}


