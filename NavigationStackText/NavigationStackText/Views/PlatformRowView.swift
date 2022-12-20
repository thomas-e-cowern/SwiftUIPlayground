//
//  PlatformRowView.swift
//  NavigationStackText
//
//  Created by Thomas Cowern on 12/20/22.
//

import SwiftUI

struct PlatformRowView: View {
    
    var platform: Platform
    
    var body: some View {
        HStack {
            Image(platform.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .padding(.trailing, 5)
            Text(platform.name)
                .foregroundColor(platform.color)
                .font(.title2)
        }
    }
}

struct PlatformRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlatformRowView(platform: Data().platforms[0])
    }
}
