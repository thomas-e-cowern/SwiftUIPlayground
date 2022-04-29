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
            Text(coin.name)
            Text(coin.symbol)
            Text(coin.priceAsDouble())
            if coin.checkForExplorer() != "https://api.coincap.io" {
                Link("Check out \(coin.name)", destination: URL(string: coin.checkForExplorer())!)
            } else {
                Link("Check out Coincap...", destination: URL(string: coin.checkForExplorer())!)
            }
        }
        .onAppear {
            coinHistoryFetch(name: coin.name.lowercased())
        }
        
        if coinPriceHistory.count == 0 {
            Text("Loading Price History")
                .fontWeight(.heavy)
        } else {
            LineChartView(dataPoints: coinPriceHistory)
                .frame(height: 200, alignment: .center)
                .padding(4)
                .background(Color.black.opacity(0.1).cornerRadius(16))
                .padding()
        }
    }
    
    func convertStringToDouble () {
        for coin in coinHistory {
            let coinPrice = coin.historyPriceAsDouble()
            print("👉 coinPrice: \(coinPrice)")
            coinPriceHistory.append(round(coinPrice * 10000) / 10000)
//            print("👉 coinPriceHistory: \(coinPriceHistory.count)")
        }
        print("👉 coinPriceHistory: \(coinPriceHistory)")
    }
    
    func coinHistoryFetch (name: String) {
        
        let coinName = name.replacingOccurrences(of: " ", with: "-")

        let historyUrlString = "https://api.coincap.io/v2/assets/\(coinName)/history?interval=m5"
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

