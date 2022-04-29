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
    var testCoinHistory = [1.0, 1.5, 1.3, 0.9, 1.2, 1.7]
    @State private var coinPriceHistory: [Double] = []
    
    var body: some View {
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
//                        Image(systemName: "link.circle")
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
            coinHistoryFetch(id: coin.id)
        }
    }
    
    func convertStringToDouble () {
        for coin in coinHistory {
            let coinPrice = coin.historyPriceAsDouble()
            print("👉 coinPrice: \(coinPrice)")
            coinPriceHistory.append(round(coinPrice * 10000) / 10000)

        }
        print("👉 coinPriceHistory: \(coinPriceHistory)")
    }
    
    func coinHistoryFetch (id: String) {
        
        let coinName = id.replacingOccurrences(of: " ", with: "-")

        let historyUrlString = "https://api.coincap.io/v2/assets/\(coinName)/history?interval=d1"
        print("History String: \(historyUrlString)")
        
        guard let url = URL(string: historyUrlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("😡😡😡 Something is wrong with data in coinHistoryFetch")
                return
            }
            
            if error != nil {
                print("😡😡😡 Error: \(String(describing: error?.localizedDescription))")
            }
            
            do {
                let jsonHistory = try JSONDecoder().decode(CoinHistoryData.self, from: data)
                DispatchQueue.main.async {
                    self.coinHistory = jsonHistory.data
                    print("👉 \(coinHistory)")
                    DispatchQueue.main.async {
                        convertStringToDouble()
                    }
                    
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
}

