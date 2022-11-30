//
//  SearchView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct SearchView: View {
    
    var items = ["item 1", "item 2", "item 3", "item 4", "item 5"]
    
    var body: some View {
        TabView {
            ForEach(items, id:\.self) { item in
                Text(item)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
