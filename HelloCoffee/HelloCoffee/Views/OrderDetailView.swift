//
//  OrderDetailView.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/13/22.
//

import SwiftUI

struct EditCoffeeErrors {
    var name: String = ""
    var coffeeName: String = ""
    var price: String = ""
}

struct OrderDetailView: View {
    
    let orderId: Int
    @EnvironmentObject private var model: CoffeeModel
    @State private var name: String = ""
    @State private var coffeeName: String = ""
    @State private var price: String = ""
    @State private var coffeeSize: CoffeeSize = .medium
    @State private var errors: EditCoffeeErrors = EditCoffeeErrors()
    
    var body: some View {
        
        if let order = model.getOrderById(orderId) {
            
            Text(order.name)
            Text(order.coffeeName)
            Text(order.size.rawValue)
            Text(order.total as NSNumber, formatter: NumberFormatter.currency)
//            Form {
//                TextField("Name", text: $name)
//                    .accessibilityIdentifier("name")
//                Text(errors.name)
//                    .visible(!errors.name.isEmpty)
//                    .font(.caption)
//
//                TextField("Coffee Name", text: $coffeeName)
//                    .accessibilityIdentifier("coffeeName")
//                Text(errors.coffeeName)
//                    .visible(!errors.coffeeName.isEmpty)
//                    .font(.caption)
//
//                TextField("Price", text: $price)
//                    .accessibilityIdentifier("price")
//                Text(errors.price)
//                    .visible(!errors.price.isEmpty)
//                    .font(.caption)
//
//                Picker("Select Size", selection: $coffeeSize) {
//                    ForEach(CoffeeSize.allCases, id: \.rawValue) { size in
//                        Text(size.rawValue).tag(size)
//                    }
//                }
//                .pickerStyle(.segmented)
//
//                Button("Place Order") {
//
//                    if isValid {
//                        Task {
//                            await placeOrder()
//                        }
//                    }
//
//                }
//                .accessibilityIdentifier("placeOrderButton")
//                .centerHorizontally()
//            }
//            .navigationTitle("Add a Coffee")
        }
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        var config = Configuration()
        
        OrderDetailView(orderId: 1)
            .environmentObject(CoffeeModel(webService: WebService(baseUrl: config.environment.baseUrl)))
    }
}
