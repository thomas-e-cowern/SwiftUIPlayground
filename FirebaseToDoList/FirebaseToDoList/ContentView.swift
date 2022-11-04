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
        NavigationView {
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
                
                List {
                    ForEach(tasks, id: \.id) { task in
                        NavigationLink(destination: TaskDetailView(task: task)) {
                            Text(task.title)
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(.plain)
                
                Spacer()
                    .onAppear {
                        fetchAllTasks()
                    }
            }
            .padding()
        }
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
                            var task = try? doc.data(as: Task.self)
                            if task != nil {
                                task!.id = doc.documentID
                            }
                            return task
                        }
                    }
                }
            }
    }
    
    private func deleteTask(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let task = tasks[index]
  
                db.collection("tasks")
                .document(task.id!)
                .delete { error in
                    if let error = error {
                        print("Error in deleteTask: \(error.localizedDescription)")
                    } else {
                        fetchAllTasks()
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
