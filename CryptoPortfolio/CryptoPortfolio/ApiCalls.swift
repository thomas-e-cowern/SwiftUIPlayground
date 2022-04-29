//
//  ApiCalls.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/28/22.
//

import Foundation

class ApiCalls {
    
    var coinHistory: [CoinHistory] = []
    
    func coinHistoryFetch (name: String) {
        
        let historyUrlString = "https://api.coincap.io/v2/assets/bitcoin/history?interval=d1"
        
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
                }
            } catch {
                
            }
        }
        task.resume()
        
    }
    
    
    
}
