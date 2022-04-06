//
//  CardView.swift
//  FlashZilla
//
//  Created by Thomas Cowern New on 4/6/22.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    @State private var isShowingAnswer = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                    .foregroundColor(.gray)
                }
            }
            .padding(25)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250, alignment: .center)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
