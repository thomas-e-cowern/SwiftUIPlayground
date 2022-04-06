//
//  CardView.swift
//  FlashZilla
//
//  Created by Thomas Cowern New on 4/6/22.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding(25)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250, alignment: .center)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
