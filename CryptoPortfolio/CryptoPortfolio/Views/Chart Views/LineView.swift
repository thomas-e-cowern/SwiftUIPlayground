//
//  LineView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/29/22.
//

import SwiftUI

struct LineView: View {
    
    var dataPoints: [Double]
    
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
                path.move(to: CGPoint(x: 0, y: height * self.ratio(for: 0)))
                
                for index in 1..<dataPoints.count {
                    path.addLine(to: CGPoint(
                        x: CGFloat(index) * width / CGFloat(dataPoints.count - 1),
                        y: height * self.ratio(for: index))
                )}
            }
                        .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 2, lineJoin: .round))
        }
        .padding(.vertical)
    }
    
    private func ratio(for index: Int) -> Double {
        dataPoints[index] / highestPoint
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(dataPoints: [1.0, 1.5, 1.3, 0.9, 1.2, 1.7])
    }
}
