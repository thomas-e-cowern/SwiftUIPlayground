//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Thomas Cowern New on 4/11/22.
//

import SwiftUI

//extension VerticalAlignment {
//    enum MidAccountAndName: AlignmentID {
//        static func defaultValue(in context: ViewDimensions) -> CGFloat {
//            context[.top]
//        }
//    }
//
//    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
//}

struct ContentView: View {
    var body: some View {
        Text("Hello World!")
            .background(.red)
            .position(x: 100, y: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
