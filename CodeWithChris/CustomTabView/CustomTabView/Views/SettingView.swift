//
//  SettingView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct SettingView: View {
    
    var items = ["cat", "dog", "mouse", "bird", "lizard", "tiger", "lion", "shark"]
    
    var body: some View {
        

        List(items, id:\.self) { item in
            Text(item)
                .foregroundColor(.blue)
                .font(.title)
        }
        .listStyle(.sidebar)

    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
