//
//  ContentView.swift
//  NavigationStackText
//
//  Created by Thomas Cowern on 12/20/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path: [Game] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    Section("Platforms") {
                        ForEach(Data().platforms, id:\.name) { platform in
                            NavigationLink(value: platform) {
                                PlatformRowView(platform: platform)
                            }
                        }
                    }
                    
                    Section("Games") {
//                        ForEach(Data().games, id: \.name) { game in
//                            NavigationLink(value: game) {
//                                Text(game.name)
//                            }
//                        }
                        Button("Add Games") {
                            path.append(Data().games.first!)
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in
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
                    }
                }
            }
            .navigationDestination(for: Game.self) { game in
                HStack {
                    Text(game.name)
                    Text(game.rating)
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
