//
//  CheckoutView.swift
//  Cupcakes
//
//  Created by Thomas Cowern New on 3/14/22.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order
    
    var body: some View {
        Text("Hello Checkout")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
