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
    
    // MARK:  Body
    var body: some View {
        VStack {
            if isOn {
                Text("Toggle is on....")
            } else {
                Text("Toggle is off...")
            }
            Toggle(isOn: $isOn) {
                Text("Turn Me On")
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
