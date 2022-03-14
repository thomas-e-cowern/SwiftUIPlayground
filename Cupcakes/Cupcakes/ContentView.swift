//
//  ContentView.swift
//  Cupcakes
//
//  Created by Thomas Cowern New on 3/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cupcake flavor", selection: $order.type) {
                        ForEach(Order.type.indices) {
                            Text(Order.type[$0])
                        }
                    }
                    
                    Stepper("Number of cupcakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Special Requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add Extra Frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add Extra Sprinkles", isOn: $order.addSprinkles)
                    }
                }
            }
            .navigationBarTitle("Cupcakes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
