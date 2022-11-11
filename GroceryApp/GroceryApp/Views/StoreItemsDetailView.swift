//
//  StoreItemsDetailView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/10/22.
//

import SwiftUI

struct StoreItemsDetailView: View {
    
    var storeItem: StoreItemViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(storeItem.name)
                    .font(.title)
                    .padding(.bottom, 10)
            }
            HStack (spacing: 80) {
                HStack {
                    Text("Price: ")
                    Text(storeItem.price as NSNumber, formatter: NumberFormatter.currency)
                }
                .font(.headline)
                Text("Quantity: \(storeItem.quantity)")
                    .font(.headline)
            }
        }
    }
}

struct StoreItemsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemsDetailView(storeItem: StoreItemViewModel(storeItem: StoreItem(name: "Test name", price: 10.0, quantity: 2)))
    }
}
