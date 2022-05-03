//
//  MainView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/30/22.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}


struct MainView: View {
    
    @StateObject var favoriteCoins = FavoriteCoins()
    
    var body: some View {
        TabView {
            ContentView()
                .environmentObject(favoriteCoins)
                .tabItem {
                Label("All Coins", systemImage: "list.bullet")
            }
            
            FirstView()
            
            FavoritesView()
                .environmentObject(favoriteCoins)
                .tabItem {
                Label("Favorites", systemImage: "star")
            }
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
