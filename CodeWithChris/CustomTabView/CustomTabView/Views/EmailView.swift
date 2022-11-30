//
//  EmailView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct EmailView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .foregroundColor(.green)
                
                Image("james-bond-no-time-to-die")
                    .resizable()
                    .scaledToFit()
                    .offset(y: -40)
                
                // Contnet
                VStack {
                    HStack {
                        Spacer()
                        Text("James Bond Dies")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                    }
                    .padding(.trailing, 5)
                    .padding(.top, 5)
                    
                    
                    Spacer()
                    ZStack (alignment: .leading) {

                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 80)
                        
                        VStack (alignment: .leading) {
                            Text("The Last James Bond Movie")
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
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
