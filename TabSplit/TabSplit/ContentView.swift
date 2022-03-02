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
    
    @State private var currencyFormat = Locale.current.currencyCode ?? "USD"
    
    @FocusState private var amountIsFocused: Bool
    @State private var isInfoShowing: Bool = false
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var tipValue: Double {
        print(currencyFormat)
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
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
//                    .pickerStyle(.segmented)
                    
                    Text("Tip Amount: \(tipValue, format: .currency(code: currencyFormat))")
                    Text("Bill plus Tip: \(checkAmount + tipValue, format: .currency(code: currencyFormat))")
                } header: {
                    Text("Select tip amount")
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: currencyFormat))
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
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Credits") {
                        isInfoShowing.toggle()
                    }
                    .sheet(isPresented: $isInfoShowing) {
                        CreditsView()
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
