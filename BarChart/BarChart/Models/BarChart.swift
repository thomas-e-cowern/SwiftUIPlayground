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
        HStack {
            ForEach(dataPoints) { data in
                Rectangle()
                    .fill(data.color)
                    .scaleEffect(y: CGFloat(data.value / maxValue))
                    .overlay(
                        Text(data.title)
                            .bold()
                    )
            }
        }
    }
}
