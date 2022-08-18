//
//  ContentView.swift
//  Particles
//
//  Created by Paul Hudson on 07/06/2020.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import SwiftUI

struct EmitterView: View {
    private struct ParticleView: View {
        var body: some View {
            Image("spark")
        }
    }
        
    private struct ParticleState<T> {
        var start: T
        var end: T
        
        init(_ start:T, _ end: T) {
            self.start = start
            self.end = end
        }
    }
    
    private func position(in proxy: GeometryProxy) -> ParticleState<CGPoint> {
        ParticleState(.zero, .zero)
    }
    
    var particleCount: Int
    var creationPoint = UnitPoint.center
    var creationRange = CGSize.zero
    
    var angle = Angle.zero
    var angleRange = Angle.zero
    
    var speed = 5.0
    var speedRange = 0.0

    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(0..<self.particleCount, id: \.self) { i in
                    ParticleView()
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            EmitterView(particleCount: 200)
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
