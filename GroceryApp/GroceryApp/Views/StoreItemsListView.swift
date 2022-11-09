//
//  StoreItemsListView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/9/22.
//

import SwiftUI

struct StoreItemsListView: View {
    
    let store: StoreViewModel
    
    var body: some View {
        Text(store.name)
    }
}

struct StoreItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemsListView(store: StoreViewModel(store: Store(name: "Test", address: "123 Test Ave")))
    }
}
