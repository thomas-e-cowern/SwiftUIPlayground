//
//  FavoritesView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct FavoritesView: View {
    
    var columns = [GridItem(.fixed(100), spacing: 5, alignment: .center),
                   GridItem(.fixed(100), spacing: 5, alignment: .center),
                   GridItem(.fixed(100), spacing: 5, alignment: .center)]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<5) { index in
                Text("Index: \(index)")
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
