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
        
        LineChartView(dataPoints: testCoinHistory)
            .frame(height: 200, alignment: .center)
            .padding(4)
            .background(Color.gray.opacity(0.1).cornerRadius(16))
            .padding()
        
        
        
    }
    
    func coinHistoryFetch (name: String) {
        
        let coinName = name.replacingOccurrences(of: " ", with: "-")

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
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
}

