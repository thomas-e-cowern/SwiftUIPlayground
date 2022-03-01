//
//  ContentView.swift
//  MyMacPlayground
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

class Settings: ObservableObject {
    @Published var counter: Int = 0
}


struct ContentView: View {
    
    @EnvironmentObject var settings: Settings
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        VStack {
            Text(colorScheme == .dark ? "DARK" : "LIGHT")
        }
        
        HStack {
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
            
            Button("Show Sheet") {
                isPresented = true
            }
            .sheet(isPresented: $isPresented) {
                QuoteView()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView().environmentObject(Settings())
    }
}
