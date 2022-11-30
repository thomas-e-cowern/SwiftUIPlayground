//
//  FavoritesView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct FavoritesView: View {
    
    var columns = [GridItem(.fixed(40), spacing: 5, alignment: .center),
                   GridItem(.fixed(40), spacing: 5, alignment: .center),
                   GridItem(.fixed(40), spacing: 5, alignment: .center)]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            Text("Placeholder One")
            Text("Placeholder Two")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
