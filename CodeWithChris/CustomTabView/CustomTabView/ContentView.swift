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
                                
                            }
                        }
                        .padding(.vertical)
                        .frame(width: (geo.size.width - 40)/5)
                    }
                    Spacer()
                }
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
