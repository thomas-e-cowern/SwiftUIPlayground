//
//  AddressView.swift
//  Cupcakes
//
//  Created by Thomas Cowern New on 3/14/22.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order: Order
    
    var body: some View {
        Text("Hello Order")
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
