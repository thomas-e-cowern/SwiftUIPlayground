//
//  ContentView.swift
//  CoreDataCombine
//
//  Created by Thomas Cowern New on 4/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = CoinViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var coins: [Coin] = []
    
    func netowrkFetch () {
        self.viewModel.fetchCoins {
            <#code#>
        }
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
