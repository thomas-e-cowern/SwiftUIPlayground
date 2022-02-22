//
//  StateCounterView.swift
//  SwiftPlay
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

struct StateCounterView: View {
    // MARK:  Properties
    @State private var counter: Int = 0
    
    // MARK:  Body
    var body: some View {
        
        let _ = Self._printChanges()
        
        VStack {
            Text("\(counter)")
                .font(.largeTitle)
            Button {
                counter += 1
            } label: {
                Text("Increment")
            }
        } // End of VStack
        .frame(width: 250, height: 250, alignment: .center)
    }
}

// MARK:  Preview
struct StateCounterView_Previews: PreviewProvider {
    static var previews: some View {
        StateCounterView()
    }
}
