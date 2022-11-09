//
//  ContentView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @ObservedObject private var storeListVM = StoreListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(storeListVM.stores, id: \.storeId) { store in
                    StoreCellView(store: store)
                        .sheet(isPresented: $isPresented, onDismiss: {
                            storeListVM.getAllStores()
                        }, content: {
                            AddStoreView()
                        })
                        .navigationTitle("Grocery App")
                        .navigationBarItems(trailing: Button(action: {
                            isPresented = true
                        }, label: {
                            Image(systemName: "plus")
                        }))
                        .onAppear {
                            storeListVM.getAllStores()
                        }
                }
                .listStyle(.plain)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
