//
//  ContentView.swift
//  Instafilter
//
//  Created by Thomas Cowern New on 3/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    // Select a pic
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter") {
                        // change filter
                    }
                    
                    Spacer()
                    
                    Button("Save") {
                        save()
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Insta Filter")
        }
    }
    
    func save () {
        print("Saved")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
