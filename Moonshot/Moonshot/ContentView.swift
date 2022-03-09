//
//  ContentView.swift
//  Moonshot
//
//  Created by Thomas Cowern New on 3/8/22.
//

import SwiftUI

struct ContentView: View {

    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            Text("Astronuats: \(astronauts.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
