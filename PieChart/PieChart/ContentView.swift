//
//  ContentView.swift
//  PieChart
//
//  Created by Thomas Cowern on 12/5/22.
//

import SwiftUI

struct DataPoint: Identifiable {
    var id: Int
    var value: Double
    var color: Color
    
    init(value: Double, color: Color) {
        self.id = Int.random(in: 1..<Int.max)
        self.value = value
        self.color = color
    }
    
    init(id: Int, value: Double, color: Color) {
        self.id = id
        self.value = value
        self.color = color
    }
}

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

struct PieChart: View {
    let pieSegments: [PieSegment]
    let strokeWidth: Double?
    
    init(dataPoints: [DataPoint], strokeWidth: Double? = nil) {
        self.strokeWidth = strokeWidth
        var segments = [PieSegment]()
        let total = dataPoints.reduce(0) { $0 + $1.value }
        var startAngle = Double.pi / 2
        
        for data in dataPoints {
            let amount = .pi * 2 * (data.value / total)
            let segment = PieSegment(data: data, startAngle: startAngle, amount: amount)
            segments.append(segment)
            startAngle += amount
        }
        
        pieSegments = segments
    }
    
    @ViewBuilder var mask : some View {
        if let strokeWidth = strokeWidth {
            Circle()
                .strokeBorder(Color.white, lineWidth: CGFloat(strokeWidth))
        } else {
            Circle()
        }
    }
    
    var body: some View {
        ZStack {
            ForEach(pieSegments) { segment in
                segment
                    .fill(segment.data.color)
            }
        }
    }
}

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
