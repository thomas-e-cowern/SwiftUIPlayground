//
//  StoreCellView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/9/22.
//

import SwiftUI

struct StoreCellView: View {
    
    @ObservedObject private var storeListVM = StoreListViewModel()
    
    var body: some View {
        
        List(storeListVM.stores, id: \.storeId) { store in
            VStack (alignment: .leading, spacing: 8) {
                Text(store.name)
                    .font(.headline)
                Text(store.address)
                    .font(.body)
            }
            
        }
        .listStyle(.plain)
    }
}

struct StoreCellView___Previews: PreviewProvider {
    static var previews: some View {
        StoreCellView()
    }
}
