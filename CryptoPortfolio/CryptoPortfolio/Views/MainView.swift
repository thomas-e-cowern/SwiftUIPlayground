//
//  MainView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/30/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var favoriteCoins = FavoriteCoins()
    
    var body: some View {
        TabView {
            ContentView()
                .environmentObject(favoriteCoins)
                .tabItem {
                Label("All Coins", systemImage: "list.bullet")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
