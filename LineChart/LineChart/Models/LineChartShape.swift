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
    let drawingLines: Bool
    
    init(dataPoints: [DataPoint], pointSize: CGFloat, drawingLines: Bool) {
        self.dataPoints = dataPoints
        self.pointSize = pointSize
        self.drawingLines = drawingLines

        let highestPoint = dataPoints.max { $0.value < $1.value }
        maxValue = highestPoint?.value ?? 1
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let drawRect = rect.insetBy(dx: pointSize, dy: pointSize)

        let xMultiplier = drawRect.width / CGFloat(dataPoints.count - 1)
        let yMultiplier = drawRect.height / CGFloat(maxValue)
        
        for (index, dataPoint) in dataPoints.enumerated() {
            var x = xMultiplier * CGFloat(index)
            var y = yMultiplier * CGFloat(dataPoint.value)

            y = drawRect.height - y
            
            x += drawRect.minX
            y += drawRect.minY
            if index == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
    
}
