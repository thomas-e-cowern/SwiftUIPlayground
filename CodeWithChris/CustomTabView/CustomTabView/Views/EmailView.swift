//
//  EmailView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct EmailView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.green)
            
            // Contnet
            VStack {
                Spacer()
                ZStack (alignment: .leading) {

                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 80)
                    
                    VStack (alignment: .leading) {
                        Text("TheLlast James Bond Moview")
                            .font(.headline)
                        Text("The one where James Bond is killled by a missle")
                            .font(.caption)
                    }
                    .padding(.horizontal)
                }
                
            }
        }
        .frame(height: 500)
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding()
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
