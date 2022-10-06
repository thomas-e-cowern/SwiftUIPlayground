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
        Text(order.name)
    }
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView(order: Order(name: "John", coffeeName: "Latte", total: 2.50, size: CoffeeSize.small))
    }
}
