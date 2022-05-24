//
//  ContentView.swift
//  BookInventory
//
//  Created by Thomas Cowern New on 5/23/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showAddScreen = false
    
    var body: some View {
        NavigationView {
            Text("Count is \(books.count)")
                .navigationTitle("Book Worm")
                .toolbar {
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
