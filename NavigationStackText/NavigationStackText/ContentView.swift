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
                            HStack {
                                Image(platform.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .padding(.trailing, 5)
                                Text(platform.name)
                                    .foregroundColor(platform.color)
                                    .font(.title2)
                            }
                        }
                    }
                }
                .navigationTitle("Gaming")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
