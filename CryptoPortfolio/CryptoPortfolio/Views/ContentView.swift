//
//  ContentView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/27/22.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
   
    @State private var isUnlocked = false
    @State private var coinsArray: [Coin] = []
    @State private var coinSearch: String = ""
    @State private var isFavorites: Bool = false
    @State private var isShowingInfo: Bool = false
    
    @EnvironmentObject var favoriteCoins: FavoriteCoins
    @EnvironmentObject var ownedCoins: OwnedCoins
    
    var body: some View {
        VStack {
            if isUnlocked {
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
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            Button {
                                isFavorites.toggle()
                            } label: {
                                if isFavorites {
                                    Text("Favorites")
                                        .padding(5)
                                        .font(.footnote)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                } else {
                                    Text("Favorites")
                                        .padding(5)
                                        .font(.footnote)
                                        .background(Color.white)
                                        .foregroundColor(.blue)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                        ToolbarItemGroup(placement: .navigationBarTrailing) {

                            Button {
                                isShowingInfo.toggle()
                            } label: {
                                Image(systemName: "info.circle")
                            }
                            .sheet(isPresented: $isShowingInfo) {
                                InfoView()
                            }
                            Button {
                                fetchCoinData()
                            } label: {
                                Image(systemName: "repeat.circle.fill")
                            }
                        }
                    }
                    .onAppear {
                        fetchCoinData()
                        favoriteCoins.loadFavorites()
                        ownedCoins.loadOwnedCoins()
                    }
                    
                   
                }
                FirstView()
            }
                .phoneOnlyNavigationView()
            } else {
                Button {
                    authenticate()
                } label: {
                    Text("Tap to unlock")
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
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
    
    func authenticate () {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // can use biometrics
            let reason = "We need to unlock your crypto portfolio"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                if success {
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    // not authenticated successfully
                    print("Failed authentication inside if \(String(describing: authenticationError?.localizedDescription))")
                }
            }
        } else {
            // No biometrics, not authorized
            print("Failed authentication else \(String(describing: error?.localizedDescription))")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
