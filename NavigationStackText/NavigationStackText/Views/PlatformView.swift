//
//  PlatformView.swift
//  NavigationStackText
//
//  Created by Thomas Cowern on 12/20/22.
//

import SwiftUI

struct PlatformView: View {
    
    var platform: Platform
    var games: [Game]
    
    var body: some View {
        ZStack {
            platform.color.ignoresSafeArea()
            VStack {
                Image(platform.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                Text(platform.name)
                    .foregroundColor(.white)
                    .font(.title)
                
                List {
                    ForEach(Data().games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        }
                    }
                }
            }
            .tint(platform.name == "IPhone" ? .white : .black)
        }
        .navigationTitle(platform.name)
        .tint(.white)
        
    }
}

struct PlatformView_Previews: PreviewProvider {
    static var previews: some View {
        PlatformView(platform: Data().platforms[3], games: Data().games)
    }
}
