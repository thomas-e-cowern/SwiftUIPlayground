//
//  ContentView.swift
//  FirebaseToDoList
//
//  Created by Thomas Cowern on 11/3/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct ContentView: View {
    
    private var db: Firestore
    
    @State private var title: String = ""
    
    init() {
        db = Firestore.firestore()
    }
    
    var body: some View {
        VStack {
            TextField("Enter Task", text: $title)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
