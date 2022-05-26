//
//  DetailView.swift
//  BookInventory
//
//  Created by Thomas Cowern New on 5/25/22.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack (alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknonw Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No Review")
                .padding()
            
            EmojiRatingView(rating: book.rating)
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book?", isPresented: $showDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {  }
        } message: {
            Text("Are you sure you want to delete this book?")
        }
        .toolbar {
            Button {
                showDeleteAlert = true
            } label: {
                Label("Delete This Book",systemImage: "trash")
            }

        }
    }
    
    func deleteBook () {
        moc.delete(book)
        
//        try? moc.save()
        
        dismiss()
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
