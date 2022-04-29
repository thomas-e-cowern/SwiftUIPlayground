//
//  LineChartCircleView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/29/22.
//

import SwiftUI

struct LineChartCircleView: View {
    
    var dataPoints: [Double]
    var radius: CGFloat
    
    var highestPoint: Double {
        let max = dataPoints.max() ?? 1.0
        if max == 0 { return 1.0 }
        return max
    }
    
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: (height * self.ratio(for: 0)) - radius))
                
                path.addArc(center: CGPoint(x: 0, y: height * self.ratio(for: 0)), radius: radius, startAngle: .zero, endAngle: .degrees(360.0), clockwise: false)
                
                for index in 1..<dataPoints.count {
                    path.move(to: CGPoint(
                        x: CGFloat(index) * width / CGFloat(dataPoints.count - 1),
                        y: height * dataPoints[index] / highestPoint)
                    )
                    
                    path.addArc(center: CGPoint(
                        x: CGFloat(index) * width / CGFloat(dataPoints.count - 1),
                        y: height * self.ratio(for: index)),
                                radius: radius, startAngle: .zero, endAngle: .degrees(360.0), clockwise: false)
                }
            }
            .stroke(Color.accentColor, lineWidth: 2)
        }
        .padding(.vertical)
    }
    
    private func ratio(for index: Int) -> Double {
        dataPoints[index] / highestPoint
    }
}

struct LineChartCircleView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartCircleView(dataPoints: [], radius: 0.0)
    }
}
