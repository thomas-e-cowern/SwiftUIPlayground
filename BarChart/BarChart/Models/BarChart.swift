//
//  BarChart.swift
//  BarChart
//
//  Created by Thomas Cowern on 12/6/22.
//

import SwiftUI

struct BarChart: View {
    let dataPoints: [DataPoint]
    let maxValue: Double

    init(dataPoints: [DataPoint]) {
        self.dataPoints = dataPoints
    
        let highestPoint = dataPoints.max { $0.value < $1.value }
        maxValue = highestPoint?.value ?? 1
    }
    
    var body: some View {
        ZStack {
            
            // Chart lines
            VStack {
                ForEach(1...10, id: \.self) { _ in
                    Divider()
                    Spacer()
                }
            }
            
            // Chart values
            HStack {
                
                VStack {
                    ForEach((1...10).reversed(), id: \.self) { i in
                        Text(String(Int(maxValue / 10 * Double(i))))
                            .padding(.horizontal)
                        Spacer()
                    }
                }
                
                //  Chart bars
                ForEach(dataPoints) { data in
                    VStack {
                        Rectangle()
                            .fill(data.color)
                            .scaleEffect(y: CGFloat(data.value / maxValue), anchor: .bottom)
                        Text(data.title)
                            .bold()
                    }
                }
            }
        }
    }
}
