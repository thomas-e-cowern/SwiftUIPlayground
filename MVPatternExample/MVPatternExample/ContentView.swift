//
//  ContentView.swift
//  MVPatternExample
//
//  Created by Thomas Cowern on 10/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    
    var body: some View {
        VStack {
            List(storeModel.products) { product in
                Text(product.title)
            }
        }.task {
            await populateProducts()
        }
        .padding()
    }
    
    private func populateProducts() async {
        do {
            try await storeModel.populateProducts()
        } catch {
            print("Error: There was an error in populateProducts in content view: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(StoreModel(webService: WebService()))
    }
}
