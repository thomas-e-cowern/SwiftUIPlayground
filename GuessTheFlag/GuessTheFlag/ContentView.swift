//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thomas Cowern New on 3/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    
    var countries = ["Estonia", "France", "Germany", "treland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the flag of ")
                    Text(countries[correctAnswer])
                }
                .foregroundColor(.white)
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                }
            }
        }
    }
    
    func flagTapped (_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Incorrect"
        }
        showingScore = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
