//
//  TogglePlayView.swift
//  SwiftPlay
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

struct TogglePlayView: View {
    // MARK:  Properties
    @State private var isOn: Bool = false
    
    @State private var toggleText: String = "on"
    
    
    
    
    // MARK:  Body
    var body: some View {
        
        VStack {
            Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                    .font(.system(size: 50))
            
            HStack {
                Toggle(isOn: $isOn) {
                    EmptyView()
                }
                .onChange(of: isOn) { newValue in

                    toggleText = isOn ? "off" : "on"
                    
                }
                .font(.system(size: 25))
                .padding(.top, 20)
                .padding(.leading, 10)
                Text("Turn me \(toggleText)")
                    .font(.system(size: 25))
                    .padding(.top, 20)
                    .padding(.leading, 10)
            }
           
        }
        .frame(width: 300, height: 300, alignment: .center)
    }
}

// MARK:  Preview
struct TogglePlayView_Previews: PreviewProvider {
    static var previews: some View {
        TogglePlayView()
    }
}
