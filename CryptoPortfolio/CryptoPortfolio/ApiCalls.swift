//
//  ApiCalls.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/28/22.
//

import Foundation

class ApiCalls {
    
    @Published var coinsArray: [Coin] = []
    
    func coinFetch () {

        let url = URL(string: "https://api.coincap.io/v2/assets")
        
        URLSession.shared.request(url: url, expecting: CoinData.self) { [self] result in
             switch result {
             case .success(let coins):
                
                 let coins = coins.data
                 
                 for coin in coins {
 //                    print("👉 \(coin)")
                     coinsArray.append(coin)
                 }
                 
 //                print(coinsArray)
                
             case.failure(let error):
                 print(error)
             }
         }
     }
    
    
}
