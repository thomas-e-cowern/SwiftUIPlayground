//
//  CardView.swift
//  FlashZilla
//
//  Created by Thomas Cowern New on 4/6/22.
//

import SwiftUI

struct CardView: View {
    
    // properties
    let card: Card
    var removal: (() -> Void)? = nil
    
    // @State properties
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    @State private var feedback = UINotificationFeedbackGenerator()
    
    //@Environment properties
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                        differentiateWithoutColor
                            ? .white
                            : .white
                                .opacity(1 - Double(abs(offset.width / 50)))

                    )
                    .background(
                        differentiateWithoutColor
                            ? nil
                            : RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(offset.width > 0 ? .green : .red)
                    )
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
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    feedback.prepare()
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        if offset.width > 0 {
                            feedback.notificationOccurred(.success)
                        } else {
                            feedback.notificationOccurred(.error)
                        }

                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        )
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
