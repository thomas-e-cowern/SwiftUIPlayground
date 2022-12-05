//
//  PieSegment.swift
//  PieChart
//
//  Created by Thomas Cowern on 12/5/22.
//

import SwiftUI

struct PieSegment: Shape, Identifiable {
    
    let data: DataPoint
    var id: Int { data.id }
    var startAngle: Double
    var amount: Double
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(startAngle, amount) }
        set {
            startAngle = newValue.first
            amount = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        var path = Path()
        
        path.move(to: center)
        path.addRelativeArc(center: center, radius: radius, startAngle: Angle(radians: startAngle), delta: Angle(radians: amount))
        
        return path
    }
}
