//
//  ContentView.swift
//  MVVMExampleApp
//
//  Created by Thomas Cowern on 10/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ProductListViewModel(webService: WebService())
    
    var body: some View {
        List(vm.products) { Product in
            Text(Product.title)
        }.task {
            await vm.populateProducts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
