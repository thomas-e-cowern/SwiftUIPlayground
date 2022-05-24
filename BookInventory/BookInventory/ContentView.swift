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
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink {
                        Text(book.title ?? "Unknown Title")
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack (alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
                .navigationTitle("Book Worm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddScreen.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showAddScreen) {
                    AddBookView()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
