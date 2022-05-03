//
//  InfoView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 5/3/22.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        Form {
            Section(header: Text("Credits")) {
                HStack {
                    Text("Developed by: Thomas E. Cowern")
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
