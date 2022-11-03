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
    @State private var tasks: [Task] = []
    
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
                title = ""

            }
            .buttonStyle(.bordered)
            
            List(tasks, id: \.title) { task in
                Text(task.title)
            }
            
            Spacer()
                .onAppear {
                    fetchAllTasks()
                }
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
                    fetchAllTasks()
                }
            }
        } catch let error {
            print("Error in ContentView: \(error.localizedDescription)")
        }
    }
    
    private func fetchAllTasks() {
        db.collection("tasks")
            .getDocuments { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let snapshot = snapshot {
                        tasks = snapshot.documents.compactMap { doc in
                            return try? doc.data(as: Task.self)
                        }
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
