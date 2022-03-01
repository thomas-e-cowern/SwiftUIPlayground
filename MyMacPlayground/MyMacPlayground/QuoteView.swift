//
//  QuoteView.swift
//  MyMacPlayground
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

struct QuoteView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("This would be a quote")
                .padding(32)
            
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.bottom, 23)
        }
        
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
