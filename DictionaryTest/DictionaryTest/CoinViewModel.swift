//
//  CoinViewModel.swift
//  DictionaryTest
//
//  Created by Thomas Cowern New on 4/26/22.
//

import Foundation

class ViewModel: ObservableObject {
//    @Published var coins:  [Coin] = []
    
    
    func fetch () {
        guard let url = URL(string: "https://api.coincap.io/v2/assets") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let coins = try JSONDecoder().decode([CoinData].self, from: data)
                DispatchQueue.main.async {
//                    self?.coins = coins
                    print("😀😀😀 \(coins) 😀😀😀")
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        
    }
}
