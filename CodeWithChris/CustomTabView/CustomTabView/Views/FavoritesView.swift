//
//  FavoritesView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct FavoritesView: View {
    
    var fixedColumns = Array(repeating: GridItem(.fixed(100), spacing: 5, alignment: .center), count: 2)
    
    var flexibleColumns = Array(repeating: GridItem(.flexible(minimum: 0)), count: 5)
    
    var adaptableColumns = Array(repeating: GridItem(.adaptive(minimum: 0)), count: 4)
    
    var body: some View {
        VStack {
            Text("Fixed Columns")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.teal)
            
            LazyVGrid(columns: fixedColumns) {
                ForEach(0..<5) { index in
                    Text("Index: \(index)")
                }
            }
            .padding(.bottom, 20)
            
            Text("Flexible Columns")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            
            LazyVGrid(columns: flexibleColumns) {
                ForEach(0..<5) { index in
                    Text("Index: \(index)")
                }
            }
            .padding(.bottom, 20)
            
            Text("Adaptable Columns")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.mint)
            
            LazyVGrid(columns: adaptableColumns) {
                ForEach(0..<5) { index in
                    Text("Index: \(index)")
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
