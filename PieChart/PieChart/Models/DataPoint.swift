//
//  DataPoint.swift
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
