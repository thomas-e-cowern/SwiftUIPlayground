//
//  ContentView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

enum Tab {
    case Home
    case Email
    case Search
    case Favorites
    case Settings
}

struct TabInfo {
    var icon: String
    var name: String
}

struct ContentView: View {
    
    var tabIcons = ["person", "envelope", "magnifyingglass", "star", "person.fill"]
    
    var body: some View {
        GeometryReader  { geo in
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                
                Spacer()
                
                VStack {
                    Path({ path in
                        path.move(to: CGPoint(x:0, y:0))
                        path.addLine(to: CGPoint(x:geo.size.width, y:0))
                    })
                    .stroke(.gray)
                    HStack (spacing: 0) {
                        Spacer()
                        ForEach(0..<5, id:\.self) { index in
                            VStack (spacing: 5) {
                                Button {
                                    print("Clicked")
                                } label: {
                                    VStack {
                                        Image(systemName: tabIcons[index])
                                            .padding(.bottom, 4)
                                        Text("Search")
                                            .font(.caption)
                                    }
                                    .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical)
                            .frame(width: (geo.size.width - 40)/5, height: 60)
                        }
                        Spacer()
                    }
                }
                .frame(height: 70)
            }
//            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
