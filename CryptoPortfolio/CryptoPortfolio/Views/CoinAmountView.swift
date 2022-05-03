//
//  CoinAmountView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 5/3/22.
//

import SwiftUI

struct CoinAmountView: View {
    
    var coin: Coin
    
    @Binding var amount: String
    
    @EnvironmentObject var ownedCoins: OwnedCoins
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Enter your coin amount below")
            TextField("  Coin amount...", text: $amount)
                .frame(width: 200, height: 50, alignment: .center)
                .border(Color.blue, width: 3)
                .cornerRadius(4)
                .keyboardType(.numbersAndPunctuation)
            
            Button("Save") {
                ownedCoins.add(coin, amount)
                ownedCoins.save()
                dismiss()
            }
            .padding()
            .border(Color.blue, width: 3)
            .cornerRadius(4)
        }
        .frame(width: 400, height: 200)
    }
}
