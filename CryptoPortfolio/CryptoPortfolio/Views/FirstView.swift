//
//  FirstView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 5/3/22.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack {
            Text("Welcome to Crypto Tracker")
                .font(.title)
            
            Text("Please select a crypto coin from the left side menu; Swipe from the left to show coin selections")
                .foregroundColor(.secondary)
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
