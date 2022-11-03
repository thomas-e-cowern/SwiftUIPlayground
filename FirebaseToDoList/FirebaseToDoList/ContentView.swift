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
                .textFieldStyle(.roundedBorder)
                .border(.black)
                .padding()
            
            Button("Save") {
                let task = Task(title: title)
                saveTask(task: task)

            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
    
    private func saveTask(task: Task) {
        do {
            _ = try db.collection("tasks").addDocument(from: task) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Document has been saved")
                }
            }
        } catch let error {
            print("Error in ContentView: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
