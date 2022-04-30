//
//  LineChartView.swift
//  CryptoPortfolio
//
//  Created by Thomas Cowern New on 4/29/22.
//

import SwiftUI

struct LineChartView: View {
    
    var dataPoints: [Double]
    var lineColor: Color = .red
    var outerCircleColor: Color = .red
    var innerCircleColor: Color = .white
    
    var body: some View {
        ZStack {
            LineView(dataPoints: dataPoints)
                .accentColor(lineColor)
            
            LineChartCircleView(dataPoints: dataPoints, radius: 3.0)
                .accentColor(outerCircleColor)
            
            LineChartCircleView(dataPoints: dataPoints, radius: 1.0)
                .accentColor(innerCircleColor)
        }
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(dataPoints: [1.0, 1.5, 1.3, 0.9, 1.2, 1.7])
    }
}
