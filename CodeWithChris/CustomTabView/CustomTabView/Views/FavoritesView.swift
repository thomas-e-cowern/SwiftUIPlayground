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
    
    var adaptableColumns = Array(repeating: GridItem(.adaptive(minimum: 100)), count: 4)
    
    var fixedRows = Array(repeating: GridItem(.fixed(50)), count: 2)
    
    var body: some View {

        ScrollView {
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
                
                ScrollView (showsIndicators: false){
                    LazyVGrid(columns: adaptableColumns) {
                        ForEach(0..<100) { index in
                            Text("Index: \(index)")
                        }
                    }
                    .padding(.bottom, 20)
                }
                
                Text("Fixed Rows")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                
                ScrollView (.horizontal) {
                    LazyHGrid(rows: fixedRows) {
                        ForEach(0..<20) { index in
                            Text("Index: \(index)")
                        }
                    }
                }
                
                Spacer()
                    .frame(height: 70)
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
