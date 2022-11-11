//
//  StoreItemsDetailView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/10/22.
//

import SwiftUI

struct StoreItemsDetailView: View {
    
    var storeItem: StoreItem
    
    var body: some View {
        VStack {
            Text(storeItem.name)
                .font(.title)
                .padding()
            HStack (spacing: 80) {
                Text("Price: \(storeItem.price as NSNumber, formatter: NumberFormatter.currency)")
                Text("Quantity: \(storeItem.quantity)")
            }
        }
    }
}

struct StoreItemsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemsDetailView(storeItem: StoreItem(name: "Test Items", price: 10.0, quantity: 2))
    }
}
