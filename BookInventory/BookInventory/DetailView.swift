//
//  DetailView.swift
//  BookInventory
//
//  Created by Thomas Cowern New on 5/25/22.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    let book: Book
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

        static var previews: some View {
            let book = Book(context: moc)
            book.title = "Test book"
            book.author = "Test author"
            book.genre = "Fantasy"
            book.rating = 4
            book.review = "This was a great book; I really enjoyed it."

            return NavigationView {
                DetailView(book: book)
            }
        }
}
