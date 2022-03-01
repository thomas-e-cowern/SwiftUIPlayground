//
//  ContentView.swift
//  TabSplit
//
//  Created by Thomas Cowern New on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount: Float = 0.0
    @State private var numberOfPeople: Int = 0
    @State private var tipPercentage: Float = 15.0
    
    let tipPercentages = [0.0, 5.0, 10.0, 15.0, 20.0, 25.0]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
