//
//  ContentView.swift
//  BarChart
//
//  Created by Thomas Cowern on 12/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redAmount = Double.random(in: 10...100)
    @State private var yellowAmount = Double.random(in: 10...100)
    @State private var greenAmount = Double.random(in: 10...100)
    @State private var blueAmount = Double.random(in: 10...100)
    
    var data: [DataPoint] {
        [
            DataPoint(id: 1, value: redAmount, color: .red, title: "Yes"),
            DataPoint(id: 2, value: yellowAmount, color: .yellow, title: "Maybe"),
            DataPoint(id: 3, value: greenAmount, color: .green, title: "No"),
            DataPoint(id: 4, value: blueAmount, color: .blue, title: "N/A")
        ]
    }
    
    var body: some View {
        BarChart(dataPoints: data)
            .onTapGesture {
                withAnimation {
                    redAmount = Double.random(in: 10...100)
                    yellowAmount = Double.random(in: 10...100)
                    greenAmount = Double.random(in: 10...100)
                    blueAmount = Double.random(in: 10...100)
                }
            }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
