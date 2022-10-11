//
//  OrderCellView.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/6/22.
//

import SwiftUI

struct OrderCellView: View {
    
    let order: Order
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(order.name)
                    .accessibilityIdentifier("orderNameText")
                    .bold()
                Text("\(order.coffeeName) (\(order.size.rawValue))")
                    .accessibilityIdentifier("coffeeNameAndSizeText")
                    .opacity(0.5)
            }
            Spacer()
            Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                .accessibilityIdentifier("coffePriceText")
        }
    }
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView(order: Order(name: "John", coffeeName: "Latte", total: 2.50, size: CoffeeSize.small))
    }
}
