//
//  ContentView.swift
//  SwiftPlay
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack (spacing: 5) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
            } // End of VStack
            .border(.pink, width: 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack (spacing: 5) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
            } // End of VStack
            .border(.yellow, width: 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack () {
                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    .offset(y: -100)
                    
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                    .offset(y: 100)
            }
        } // End of HStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
