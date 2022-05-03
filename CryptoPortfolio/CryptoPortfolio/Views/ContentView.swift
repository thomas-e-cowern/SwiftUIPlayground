//
//  ContentView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/27/22.
//

import SwiftUI

struct ContentView: View {
   
    @State private var coinsArray: [Coin] = []
    @State private var coinSearch: String = ""
    @State private var isFavorites: Bool = false
    
    @EnvironmentObject var favoriteCoins: FavoriteCoins
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if coinsArray.count == 0 {
                        VStack {
                            Text("Loading...")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                    } else {
                        if  isFavorites {
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
                        } else {
                            ForEach(searchResults) { coin in
                                NavigationLink (destination: CoinDetailView(coin: coin)) {
                                    CoinListView(coin: coin)
                                }
                            }
                            .searchable(text: $coinSearch)
                        }
                    }
                }
                .navigationTitle("Crypto Portfolio")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            fetchCoinData()
                        } label: {
                            Image(systemName: "repeat.circle.fill")
                        }
                    }
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Toggle("View Favorites", isOn: $isFavorites)
                    }
                }
                .onAppear {
                    fetchCoinData()
                    favoriteCoins.loadFavorites()
                }
                
               
            }
            FirstView()
        }
        .phoneOnlyNavigationView()
    }
    
    var searchResults: [Coin] {
        if coinSearch.isEmpty {
            return coinsArray
        } else {
            let filtered = coinsArray.filter { $0.symbol.contains("\(coinSearch.uppercased())") }
            return filtered
        }
    }
    
    func fetchCoinData () {
        CoinContoller.fetchCoinPrices { coins in
            guard let fetchedCoins = coins else { return }
            DispatchQueue.main.async {
                self.coinsArray = fetchedCoins
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
