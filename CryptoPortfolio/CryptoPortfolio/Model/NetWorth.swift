//
//  NetWorth.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 5/16/22.
//

import Foundation

class NetWorth: ObservableObject {
    
    @Published var netWorth = ""
    
    var ownedCoins = OwnedCoins()
    var coinController = CoinContoller()
    
    
    
    init () {
        ownedCoins.loadOwnedCoins()
    }
    
    func getNetWorth () {
        
    }
    
}
