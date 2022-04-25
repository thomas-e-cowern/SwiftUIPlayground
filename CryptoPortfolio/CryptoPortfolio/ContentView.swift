//
//  ContentView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/25/22.
//

import SwiftUI

struct ContentView: View {
    
    let coins: [Coin] = Bundle.main.decode("TestCryptoData.json")
    
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
            .navigationTitle("Crypto Portfolio")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
