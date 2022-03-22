//
//  ContentView.swift
//  AccessabilityApp
//
//  Created by Thomas Cowern New on 3/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var score = 900
    @State private var value = 10
     
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        ScrollView (showsIndicators: true) {
            VStack (spacing: 40) {
                Image(pictures[selectedPicture])
                     .resizable()
                     .scaledToFit()
                     .onTapGesture {
                         selectedPicture = Int.random(in: 0...3)
                     }
                     .accessibilityLabel(labels[selectedPicture])
                     .accessibilityAddTraits(.isButton)
                     .accessibilityRemoveTraits(.isImage)

//                 Image(decorative: "character")
//                     .resizable()
//                     .scaledToFit()
//                     .frame(width: 100, height: 200, alignment: .center)
//                     .accessibilityHidden(true)

                    Text("Your score is \(score)")
                        .font(.title)

                    VStack {
                        Text("Value is \(value)")

                        Button("Increment") {
                            value += 1
                        }

                        Button("Decrement") {
                            value -= 1
                        }
                    }
                    .accessibilityElement()
                    .accessibilityLabel("Value")
                    .accessibilityValue(String(value))
                    .accessibilityAdjustableAction { direction in
                        switch direction {
                        case .increment:
                            value += 1
                        case .decrement:
                            value -= 1
                        default:
                            print("Not handled.")
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
