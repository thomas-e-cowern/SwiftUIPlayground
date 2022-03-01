//
//  ContentView.swift
//  TabSplit
//
//  Created by Thomas Cowern New on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 0
    @State private var tipPercentage: Int = 15
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var tipValue: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue =  checkAmount * tipSelection / 100
        
        return tipValue
    }
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople + 1)
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Bill amount")
                }
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("Tip Amount: \(tipValue, format: .currency(code: Locale.current.currencyCode ?? "USD"))")
                    Text("Bill plus Tip: \(checkAmount + tipValue, format: .currency(code: Locale.current.currencyCode ?? "USD"))")
                } header: {
                    Text("Select tip amount")
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total per person")
                }
            }
            .navigationTitle("Tab Split")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
