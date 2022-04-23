//
//  ContentView.swift
//  CoreDataCombine
//
//  Created by Thomas Cowern New on 4/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = CoinViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var monitor = NetworkMonitor()
    
    @State var coins: [Coin] = []
    
    func netowrkFetch () {
        self.viewModel.fetchCoins {
            <#code#>
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Image(systemName: monitor.isConnected ? "wifi" : "wifi.slash")
                        .font(.system(size: 56))
                    Text(monitor.isConnected ? "connected" : "not connected")
                }
                ScrollView {
                    ForEach(viewModel.myCoins, id: \.self) { coin in
                        HStack {
                            let fixUrl = coin.iconUrl.replacingOccurrences(of: "svg", with: "png")
                            
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
