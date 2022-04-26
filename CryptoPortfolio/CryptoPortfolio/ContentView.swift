//
//  ContentView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/25/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var coins = [Coin]()
    
    var body: some View {
        NavigationView {
            List(coins) { coin in
                HStack {
                    Image("\(coin.image)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text(coin.symbol)
                        .padding()
                }
            }
            .task {
                await loadData()
            }
            .navigationTitle("Crypto Portfolio")
        }
    }
    
    func loadData () async {
        guard let url = URL(string: "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD?41078caa97fa9605b5ef004240a4ca29a0232c079d97c52fc6a9febe085694c2") else {
            print("😡😡😡 Invalid URL 😡😡😡")
            return
        }
        
        do {
            print("😀😀😀 Inside do block 😀😀😀")
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResults = try? JSONDecoder().decode(Coins.self, from: data) {
                coins = decodedResults.coins
                print("😡😡😡 \(coins) 😡😡😡")
            }
        } catch {
            print("😡😡😡 Invalid data from catch block 😡😡😡")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
