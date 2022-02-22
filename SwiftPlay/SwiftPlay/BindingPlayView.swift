//
//  BindingPlayView.swift
//  SwiftPlay
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

struct BindingPlayView: View {
    
    @Binding var colorSelected: Color
    
    let colors: [Color] = [.red, .green, .yellow, .blue, .purple]
    
    var body: some View {
        HStack {
            VStack {
                ForEach(colors, id: \.self) { color in
                    ZStack {
                        Circle()
                            .foregroundColor(color)
                            .onTapGesture {
                                colorSelected = color

                        }
                    }
                }
            }
            .frame(width: 300, height: 300, alignment: .center)
            
            Rectangle()
                .foregroundColor(colorSelected)
        }
    }
}

struct BindingPlayView_Previews: PreviewProvider {
    static var previews: some View {
        BindingPlayView(colorSelected: .constant(.red))
    }
}
