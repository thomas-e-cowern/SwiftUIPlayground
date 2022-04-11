//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Thomas Cowern New on 4/11/22.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack (alignment: .midAccountAndName) {
            VStack {
                Text("@thomas.e.cowern")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image("thomas-cowern-small")
                    . resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full Name:")
                Text("Thomas Cowern")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
