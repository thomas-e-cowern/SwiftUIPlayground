//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Thomas Cowern New on 4/14/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to Snow Seeker")
                .font(.title)
            
            Text("Please select a resort from the left side menu; Swipe form the left edge to show resorts")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
