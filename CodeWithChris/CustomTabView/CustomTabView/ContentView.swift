//
//  ContentView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct ContentView: View {
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
                        ForEach(0..<5, id:\.self) { _ in
                            VStack (spacing: 5) {
                                Button {
                                    print("Clicked")
                                } label: {
                                    VStack {
                                        Image(systemName: "magnifyingglass")
                                            .padding(.bottom, 4)
                                        Text("Search")
                                            .font(.caption)
                                    }
                                    .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical)
                            .frame(width: (geo.size.width - 40)/5, height: 70)
                        }
                        Spacer()
                    }
                }
                .frame(height: 80)
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
