//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Thomas Cowern New on 4/13/22.
//

import SwiftUI

struct ContentView: View {
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var body: some View {
        
        NavigationView {
            List(resorts) { resort in
                Text(resort.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
