//
//  CoinViewModel.swift
//  CoreDataCombine
//
//  Created by Thomas Cowern New on 4/23/22.
//

import SwiftUI
import Combine

class CoinViewModel: ObservableObject {
    
    private let cryptoService = Api()
    @Published var myCoins: [Coin] = []
    @Published var isLoading: Bool = false
    
    var cancellable: AnyCancellable?
    
    func fetchCoins(completion: @escaping () -> Void) {
        self.isLoading = true
        cancellable = cryptoService.fetchCoin().sink(receiveCompletion: { error in
            print(error)
        }, receiveValue: { cryptoContainer in
            self.myCoins = cryptoContainer.data.coins
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isLoading = false
                completion()
            }
        })
    }
    
}

struct CoinViewModel_Previews: PreviewProvider {
    static var previews: some View {
        CoinViewModel()
    }
}

class Api {
    func fetchCoin () -> AnyPublisher<GetDataDTO, Error> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: "https://api.coinranking.com/v2/coins")!)
            .map { $0.data }
            .decode(type: GetDataDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


