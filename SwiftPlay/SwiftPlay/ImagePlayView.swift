//
//  ImagePlayView.swift
//  SwiftPlay
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

struct ImagePlayView: View {
    // MARK:  Properties
    let cities = ["Denver", "Houston", "Seattle"]
    
    // MARK:  Body
    var body: some View {
        VStack {
            ForEach(cities, id: \.self) { city in
                HStack {
                    HStack {
                        
                        Spacer()
                        
                        Text(city)
                            .padding(.trailing, 10)
                        
                        Spacer()
                    }
                    .frame(width: 150)
                    Image(city)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding(.trailing, 15)
                }
            }
        }
    }
}

// MARK:  Preview
struct ImagePlayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ImagePlayView()
        }
        .frame(width: 500)
    }
}
