//
//  ContentView.swift
//  NavigationStackText
//
//  Created by Thomas Cowern on 12/20/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
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
                        ForEach(Data().games, id: \.name) { game in
                            NavigationLink(value: game) {
                                Text(game.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in

            }
            .navigationDestination(for: Game.self) { game in
                VStack (spacing: 20) {
                    HStack {
                        Text("\(game.name), ")
                        Text("Rating: \(game.rating)")
                    }
                    .font(.title)
                    
                    Button("Recomended Game") {
                        path.append(Data().games.randomElement()!)
                    }
                    
                    Button("Go to another platform") {
                        path.append(Data().platforms.randomElement()!)
                    }
                    
                    Button("Go Home") {
                        path.removeLast(path.count)
                    }
                }
            }
        }
        .tint(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
