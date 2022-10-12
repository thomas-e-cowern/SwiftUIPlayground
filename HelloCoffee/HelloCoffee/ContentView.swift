//
//  ContentView.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    
    @EnvironmentObject private var model: CoffeeModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if model.orders.isEmpty {
                    Text("No orders available")
                        .accessibilityIdentifier("noOrdersText")
                } else {
                    List {
                        ForEach(model.orders) { order in
                            OrderCellView(order: order)
                        }
                        .onDelete(perform: <#T##Optional<(IndexSet) -> Void>##Optional<(IndexSet) -> Void>##(IndexSet) -> Void#>)
                    }
                }
            }
            .padding()
            .task {
                await populateOrders()
            }
            .sheet(isPresented: $isPresented, content: {
                AddCoffeeView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Order") {
                        isPresented = true
                    }
                    .accessibilityIdentifier("addNewOrderButton")
                }
            }
        }
    }
    
    private func populateOrders() async {
        do {
            try await model.populateOrders()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var config = Configuration()
        ContentView().environmentObject(CoffeeModel(webService: WebService(baseUrl: config.environment.baseUrl)))
    }
}
