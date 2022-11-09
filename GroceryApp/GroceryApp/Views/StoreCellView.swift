//
//  StoreCellView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/9/22.
//

import SwiftUI

struct StoreCellView: View {
    
    var store: StoreViewModel
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 8) {
            Text(store.name)
                .font(.headline)
            Text(store.address)
                .font(.body)
        }
    }
}

struct StoreCellView___Previews: PreviewProvider {
    static var previews: some View {
        StoreCellView(store: StoreViewModel(store: Store(name: "Test", address: "123 Test Ave")))
    }
}
