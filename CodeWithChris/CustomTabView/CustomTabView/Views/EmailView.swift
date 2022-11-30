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
            
            Image("james-bond-no-time-to-die")
                .resizable()
                .scaledToFit()
                .offset(y: -40)
            
            // Contnet
            VStack {
                Spacer()
                ZStack (alignment: .leading) {

                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 80)
                    
                    VStack (alignment: .leading) {
                        Text("TheLlast James Bond Movie")
                            .font(.headline)
                        Text("The one where James Bond is killled by a missle")
                            .font(.caption)
                    }
                    .padding(.horizontal)
                }
                
            }
        }
        .frame(height: 420)
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
