//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Thomas Cowern New on 4/11/22.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
        
        static let midAccountName = VerticalAlignment(MidAccountAndName.self)
    }
}

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("@thomas.e.cowern")
                Image("thomas-cowern-small")
                    . resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full Name:")
                Text("Thomas Cowern")
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
