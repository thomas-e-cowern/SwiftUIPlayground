//
//  CoinAmountView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 5/3/22.
//

import SwiftUI

struct CoinAmountView: View {
    
    var coin: Coin
    var deleteIsUsable: Bool = true
    
    @Binding var amount: String
    
    @EnvironmentObject var ownedCoins: OwnedCoins
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Enter your coin amount below")
            TextField("Coin amount...", text: $amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numbersAndPunctuation)
            
            HStack {
                Button("Save") {
                    ownedCoins.add(coin, amount)
                    ownedCoins.save()
                    dismiss()
                }
                .frame(width: 60)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(4)
                
                Button("Delete") {
                    ownedCoins.remove(coin)
                    ownedCoins.save()
                    amount = "0.0"
                    dismiss()
                }
                .frame(width: 60)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(4)
                .disabled(deleteIsUsable)
                
                Button("Cancel") {
                    dismiss()
                }
                .frame(width: 60)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(4)
            }
        }
        .frame(width: 200, height: 200)
//        .onDisappear {
//            print("Coin amount view dissapeared")
//            ownedCoins.loadOwnedCoins()
//        }
    }
}
