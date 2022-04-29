//
//  ContentView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    
//    let url = URL(string: "https://api.coincap.io/v2/assets")
    let coinUrlString = "https://api.coincap.io/v2/assets"
    @State private var coinsArray: [Coin] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if coinsArray.count == 0 {
                        VStack {
                            Text("Loading...")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                    } else {
                        ForEach(coinsArray) { coin in
                            NavigationLink (destination: CoinDetailView(coin: coin)) {
                                CoinListView(coin: coin)
                            }
                        }
                    }
                }
                .navigationTitle("Crypto Portfolio")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            // update coins array
                            fetchCoinData()
                        } label: {
                            Image(systemName: "repeat.circle.fill")
                        }
                    }
                }
                .onAppear {
                    fetchCoinData()
                }
            }
            
        }
    }
    
    func fetchCoinData () {
        guard let url = URL(string: coinUrlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode(CoinData.self, from: data)
                DispatchQueue.main.async {
                    self.coinsArray = jsonResult.data
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
