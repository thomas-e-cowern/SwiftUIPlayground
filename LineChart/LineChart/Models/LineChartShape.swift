//
//  LineChartShape.swift
//  LineChart
//
//  Created by Thomas Cowern on 12/7/22.
//

import SwiftUI

struct LineChartShape: Shape {
    
    let dataPoints: [DataPoint]
    let pointSize: CGFloat
    let maxValue: Double
    
    init(dataPoints: [DataPoint], pointSize: CGFloat) {
        self.dataPoints = dataPoints
        self.pointSize = pointSize

        let highestPoint = dataPoints.max { $0.value < $1.value }
        maxValue = highestPoint?.value ?? 1
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
            let drawRect = rect.insetBy(dx: pointSize, dy: pointSize)

            // more code to come
    }
    
}
