//
//  CryptoPortfolioApp.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/27/22.
//

import SwiftUI

@main
struct CryptoPortfolioApp: App {
    
    @StateObject var favoriteCoins = FavoriteCoins()
    @StateObject var ownedCoins = OwnedCoins()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoriteCoins)
                .environmentObject(ownedCoins)
        }
    }
}
