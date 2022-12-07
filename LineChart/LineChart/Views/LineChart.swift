//
//  LineChart.swift
//  LineChart
//
//  Created by Thomas Cowern on 12/7/22.
//

import SwiftUI

struct LineChart: View {
    let dataPoints: [DataPoint]
    var lineColor = Color.primary
    var lineWidth: CGFloat = 2
    var pointSize: CGFloat = 5
    var pointColor = Color.primary

    var body: some View {
        ZStack {
            if lineColor != .clear {
                LineChartShape(dataPoints: dataPoints, pointSize: pointSize, drawingLines: true)
                    .stroke(lineColor, lineWidth: lineWidth)
            }

            if pointColor != .clear {
                LineChartShape(dataPoints: dataPoints, pointSize: pointSize, drawingLines: false)
                    .fill(pointColor)
            }
        }
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(dataPoints: [DataPoint(value: 1.0), DataPoint(value: 2.0), DataPoint(value: 2.5), DataPoint(value: 4.0)])
    }
}
