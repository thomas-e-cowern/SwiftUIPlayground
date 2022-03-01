//
//  CounterView.swift
//  MyMacPlayground
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

struct CounterView: View {
    
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        VStack {
  
            Button {
                print("Left")
            } label: {
                Text("Left")
            }
            
            Button {
                print("Right")
            } label: {
                Text("Right")
            }

            
            
//            Text("\(settings.counter)")
//                .font(.largeTitle)
//
//            Button {
//                settings.counter += 2
//            } label: {
//                Text("Increment")
//            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
//        CounterView().environmentObject(Settings())
    }
}
