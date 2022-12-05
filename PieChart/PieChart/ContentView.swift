//
//  ContentView.swift
//  PieChart
//
//  Created by Thomas Cowern on 12/5/22.
//

import SwiftUI

struct DataPoint: Identifiable {
    var id: Int
    var value: Double
    var color: Color
    
    init(value: Double, color: Color) {
        self.id = Int.random(in: 1..<Int.max)
        self.value = value
        self.color = color
    }
    
    init(id: Int, value: Double, color: Color) {
        self.id = id
        self.value = value
        self.color = color
    }
}

struct PieSegment: Shape, Identifiable {
    let data: DataPoint
    var id: Int { data.id }
    var startAngle: Double
    var amount: Double
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
