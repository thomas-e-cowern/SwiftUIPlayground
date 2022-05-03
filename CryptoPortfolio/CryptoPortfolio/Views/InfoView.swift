//
//  InfoView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 5/3/22.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("About Crypto Portfolio")) {
                HStack {
                    Text("Crypto Portfolio is not responsible for investing performance of any person using this app")
                        .multilineTextAlignment(.leading)
                }
                HStack {
                    Text("Crypto Portfolio uses data from coincap.io")
                }
                HStack {
                    Link("Visit coincap.io", destination: URL(string: "https://coincap.io")!)
                }
            }
            
            
            Section(header: Text("Credits")) {
                HStack {
                    Text("Developed by: Thomas E. Cowern")
                }
                HStack {
                    Text("Based on a project by Nick Walter")
                }
                HStack {
                    Text("Coin Images : https://github.com/spothq/cryptocurrency-icons")
                }
                HStack (alignment: .center) {
                    Spacer()
                    Button("Dismiss") {
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
        
        
        
        Spacer()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
