//
//  CoinViewModel.swift
//  CoreDataCombine
//
//  Created by Thomas Cowern New on 4/23/22.
//

import SwiftUI
import Combine

struct CoinViewModel: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoinViewModel_Previews: PreviewProvider {
    static var previews: some View {
        CoinViewModel()
    }
}

class Api {
    func fetchCoin () -> AnyPublisher<GetDataDTO, Error> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: "https://api.coinranking.com/v2/coins"))
            .map { $0.data }
            .decode(type: GetDataDTO, decoder: <#T##TopLevelDecoder#>)
    }
}

struct GetDataDTO : Decodable {
    let status: String
    let data: CryptoData
}

struct CryptoData : Decodable {
    let coins: [Coin]
}

struct Coin: Decodable, Hashable {
    let name: String
    let price: String
    let symbol: String
    let marketCap: String
    let iconUrl: String
}
