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
    @Environment(\.dismiss) private var dismiss
    @State private var isPresented: Bool = false
    
//    @State private var name: String = ""
//    @State private var coffeeName: String = ""
//    @State private var price: String = ""
//    @State private var coffeeSize: CoffeeSize = .medium
//    @State private var errors: EditCoffeeErrors = EditCoffeeErrors()
    
    var body: some View {
        
        if let order = model.getOrderById(orderId) {
            
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(order.coffeeName)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityIdentifier("coffeeNameText")
                    Text(order.size.rawValue)
                        .opacity(0.5)
                    Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                    
                    HStack {
                        Spacer()
                        Button("Delete Order", role: .destructive) {
                            Task {
                                await deleteOrder()
                            }
                        }
                        Button("Edit Order") {
                            isPresented = true
                        }.accessibilityIdentifier("editOrderButton")
                        Spacer()
                    }
                }.sheet(isPresented: $isPresented) {
                    AddCoffeeView(order: order)
                }
            }
            .padding()
            
            Spacer()
            
        }
    }
    
    private func deleteOrder() async {
        do {
            try await model.deleteOrder(orderId)
        } catch {
            print("There was a problem with deleteOrder in OrderDetailView: \(error.localizedDescription)")
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
