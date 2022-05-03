//
//  FavoritesView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 5/2/22.
//

import SwiftUI

struct FavoritesView: View {
    
    @State private var coinsArray: [Coin] = []
    
    @EnvironmentObject var favoriteCoins: FavoriteCoins
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(coinsArray) { coin in
                        if favoriteCoins.contains(coin) {
                            NavigationLink (destination: CoinDetailView(coin: coin)) {
                                CoinListView(coin: coin)
                            }
                        }
                    }
                }
                .navigationTitle("Crypto Favorites")
                .onAppear {
                    favoriteCoins.loadFavorites()
                    fetchCoinData()
                }
            }
        }
    }
    
    func fetchCoinData () {
        CoinContoller.fetchCoinPrices { coins in
            guard let fetchedCoins = coins else { return }
            print("😡😡😡 \(fetchedCoins)")
            DispatchQueue.main.async {
                self.coinsArray = fetchedCoins
            }
        }
    }
}
