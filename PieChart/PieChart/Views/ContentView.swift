//
//  ContentView.swift
//  PieChart
//
//  Created by Thomas Cowern on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redAmount = Double.random(in: 10...100)
    @State private var yellowAmount = Double.random(in: 10...100)
    @State private var greenAmount = Double.random(in: 10...100)
    @State private var blueAmount = Double.random(in: 10...100)
    
    var data: [DataPoint] {
        [
            DataPoint(id: 1, value: redAmount, color: .red),
            DataPoint(id: 2, value: yellowAmount, color: .yellow),
            DataPoint(id: 3, value: greenAmount, color: .green),
            DataPoint(id: 4, value: blueAmount, color: .blue)
        ]
    }
    
    var body: some View {
        PieChart(dataPoints: data)
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
