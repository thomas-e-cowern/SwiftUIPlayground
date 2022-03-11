//
//  ContentView.swift
//  Moonshot
//
//  Created by Thomas Cowern New on 3/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showGrid: Bool = false

    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        VStack (alignment: .trailing) {
            Button {
                showGrid.toggle()
            } label: {
                if showGrid {
                    Text("Show as List")
                } else {
                    Text("Show as Grid")
                }
            }
        .foregroundColor(.white)
        }
       

        Group {
            if showGrid {
                MissionGridView()
            } else {
                MissionListView()
            }
        }
        .navigationTitle("My Group")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
