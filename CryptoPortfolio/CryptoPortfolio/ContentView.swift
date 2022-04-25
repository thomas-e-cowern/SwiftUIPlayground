//
//  ContentView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/25/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var coins = CoinData.shared.coins
    
    var body: some View {
        NavigationView {
            List(coins) { coin in
                HStack {
                    Text(coin.symbol)
                        .padding()
                    Image("\(coin.image)")
                }
            }
            .navigationTitle("Crypto Portfolio")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
