//
//  MainView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/30/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
            .tabItem {
                Label("All Coins", systemImage: "list.bullet")
            }
            
            CoinFavoriteView()
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
