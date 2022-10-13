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
    @State private var isPresented: Bool = false
    
//    @State private var name: String = ""
//    @State private var coffeeName: String = ""
//    @State private var price: String = ""
//    @State private var coffeeSize: CoffeeSize = .medium
//    @State private var errors: EditCoffeeErrors = EditCoffeeErrors()
    
    var body: some View {
        
        if let order = model.getOrderById(orderId) {
            
            
            Text(order.name)
            Text(order.coffeeName)
            Text(order.size.rawValue)
            Text(order.total as NSNumber, formatter: NumberFormatter.currency)
            
            HStack {
                Spacer()
                Button("Delete Order", role: .destructive) {
                    // Delete here
                }
                .accessibilityIdentifier("deleteOrderButton")
                Button("Edit Order") {
                    // Edit here
                    isPresented = true
                }
                .accessibilityIdentifier("editOrderButton")
                Spacer()
            }
            .sheet(isPresented: $isPresented) {
                AddCoffeeView(order: order)
            }
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
