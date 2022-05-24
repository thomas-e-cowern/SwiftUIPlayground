//
//  ContentView.swift
//  BookInventory
//
//  Created by Thomas Cowern New on 5/23/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            Text("Start Over")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
