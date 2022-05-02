//
//  CoinFavoriteView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/30/22.
//

import SwiftUI

struct CoinFavoriteView: View {
    
//    @State private var coinsArray: [Coin] = []
    @StateObject var favoriteCoins = FavoriteCoins()
    @State private var coinSearch: String = ""
    @State private var favoriteCoinArray: [Coin] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if favoriteCoinArray.count == 0 {
                        VStack {
                            Text("Loading...")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                    } else {
                        ForEach(favoriteCoinArray) { coin in
                            NavigationLink (destination: CoinDetailView(coin: coin)) {
                                CoinListView(coin: coin)
                            }
                        }
                        .searchable(text: $coinSearch)
                    }
                }
                .navigationTitle("Crypto Portfolio")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            // update coins array
                            
//                            CoinContoller.shared.saveData()
                            CoinContoller.shared.loadData()
                            favoriteCoinArray = CoinContoller.shared.favoriteCoins
                            print(" $$$$$ \(favoriteCoinArray)")
//                            fetchCoinData()
                        } label: {
                            Image(systemName: "repeat.circle.fill")
                        }
                    }
                }
                .environmentObject(favoriteCoins)
                .onAppear {
//                    fetchCoinData()
//                    CoinContoller.shared.loadData()
//                    CoinContoller.shared.getCoinPrice(coin: "bitcoin")
                }
            }
            
        }
    }
    
    var searchResults: [Coin] {
        if coinSearch.isEmpty {
            return favoriteCoinArray
        } else {
            let filtered = favoriteCoinArray.filter { $0.symbol.contains("\(coinSearch.uppercased())") }
            return filtered
        }
    }
    
    func fetchCoinData () {
        CoinContoller.fetchCoinPrices { coins in
            guard let fetchedCoins = coins else { return }
            DispatchQueue.main.async {
                self.favoriteCoinArray = fetchedCoins
            }
        }
    }
}
