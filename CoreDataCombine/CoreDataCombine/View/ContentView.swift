//
//  ContentView.swift
//  CoreDataCombine
//
//  Created by Thomas Cowern New on 4/23/22.
//

import SwiftUI
import SDWebImageSwiftUI

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
                            WebImage(url: URL(string: fixUrl))
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(coin.name + ": " + coin.price)
                            
                            
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    }
                    .padding()
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
