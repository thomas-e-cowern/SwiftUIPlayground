//
//  CoinDetailView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/28/22.
//

import SwiftUI

struct CoinDetailView: View {
    var coin: Coin
    
    @State private var coinHistory: [CoinHistory] = []
    @State private var coinPriceHistory: [Double] = []
    @State private var isFavorite: Bool = false
    
    @EnvironmentObject var favoriteCoins: FavoriteCoins
    @EnvironmentObject var ownedCoins: OwnedCoins
    
    @State private var showSheet = false
    @State private var amount: String = ""
    
    var body: some View {
        VStack (alignment: .center) {
    
            Text("You own \(amount) \(coin.name) crypto-currency")
                .padding(4)
            Text("The value of your \(coin.name) crypto-currency is $\(returnValue(amount: amount, price: coin.priceUsd))")
                .padding(4)
    
            VStack (alignment: .center) {
                checkForImage(symbol: coin.symbol.lowercased())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)

            }
            
            Text(coin.name)
                .foregroundColor(.blue)
                .fontWeight(.heavy)
                .padding(.top, 20)
            
            Button(favoriteCoins.contains(coin) ? "Remove from favorites" : "Add to favorites") {
                if favoriteCoins.contains(coin) {
                    favoriteCoins.remove(coin)
                    favoriteCoins.save()
                } else {
                    favoriteCoins.add(coin)
                    favoriteCoins.save()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 10)

            Button(ownedCoins.contains(coin) ? "Edit owned coin" : "Add coins owned") {
                showSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 10)
            .sheet(isPresented: $showSheet) {
                CoinAmountView(coin: coin, amount: $amount)
            }
        }
        
        List() {
            Section(header: Text("\(coin.name) info")) {
                HStack {
                    Label("Coin Name: ", systemImage: "keyboard")
                    Text(coin.name)
                }
                HStack {
                    Label("Coin Symbol: ", systemImage: "star")
                    Text(coin.symbol)
                }
                HStack {
                    Label("Current Price: ", systemImage: "dollarsign.circle")
                    Text(coin.priceAsDouble())
                }
                if coin.checkForExplorer() != "https://api.coincap.io" {
                    HStack {
                        Label("Check out \(coin.name)", systemImage: "link.circle")
                        Link("here...", destination: URL(string: coin.checkForExplorer())!)
                    }
                } else {
                    HStack {
                        Label("There is no link for \(coin.name)", systemImage: "eye.slash.circle")
                    }
                    
                }
                
            }
            
            Section(header: Text("\(coin.name) previous day chart")) {
                if coinPriceHistory.count == 0 {
                    Text("Loading Price History")
                        .fontWeight(.heavy)
                } else {
                    LineChartView(dataPoints: coinPriceHistory)
                        .frame(height: 200, alignment: .center)
                        .padding(4)
                        .background(Color.black.opacity(0.7).cornerRadius(16))
                        .padding()
                }
            }
        }
        .onAppear {
            fetchCoinHistory(id: coin.id)
            ownedCoins.loadOwnedCoins()
            amount = ownedCoins.getValue(coin)
        }
    }
    
    func convertStringToDouble () {
        for coin in coinHistory {
            let coinPrice = coin.historyPriceAsDouble()
            coinPriceHistory.append(round(coinPrice * 10000) / 10000)
        }
    }
    
    func fetchCoinHistory (id: String) {
        
        CoinContoller.shared.coinHistoryFetch2(id: id) { history in
            guard let fetchedHistory = history else { return }
            self.coinHistory = fetchedHistory
            DispatchQueue.main.async {
                convertStringToDouble()
            }
        }
    }
    
    func checkForImage(symbol: String) -> Image {
        let image = (UIImage(named: symbol) ?? UIImage(named: "generic.png"))!
        return Image(uiImage: image)
    }
    
    func returnValue(amount: String, price: String) -> String {

        guard let price = Double(price) else { return "" }
        
        guard let amount = Double(amount) else { return "" }
        
        let returnAmount = round((amount * price) * 100) / 100
        
        print("Return Amount: \(returnAmount)")
    
        return String(returnAmount)
    }
}

