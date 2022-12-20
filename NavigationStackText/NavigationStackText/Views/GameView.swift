//
//  GameView.swift
//  NavigationStackText
//
//  Created by Thomas Cowern on 12/20/22.
//

import SwiftUI

struct GameView: View {
    
    var game: Game
    
    var body: some View {
        VStack (spacing: 20) {
            HStack {
                Text("\(game.name), ")
                Text("Rating: \(game.rating)")
            }
            .font(.title)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: Data().games[2])
    }
}
