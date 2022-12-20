//
//  ContentView.swift
//  NavigationStackText
//
//  Created by Thomas Cowern on 12/20/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("Platforms") {
                        ForEach(PlatformData().platforms, id:\.name) { platform in
                            NavigationLink(value: platform) {
                                PlatformRowView(platform: platform)
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
