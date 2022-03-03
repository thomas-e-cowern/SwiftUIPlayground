//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thomas Cowern New on 3/3/22.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "treland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        VStack {
            Text("Tap the flag of ")
            Text(countries[correctAnswer])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
