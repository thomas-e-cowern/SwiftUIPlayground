//
//  OrderCellView.swift
//  HelloCoffee
//
//  Created by Thomas Cowern on 10/6/22.
//

import SwiftUI

struct OrderCellView: View {
    var body: some View {
        Text(order.name)
    }
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView()
    }
}
