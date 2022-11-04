//
//  TaskDetailView.swift
//  FirebaseToDoList
//
//  Created by Thomas Cowern on 11/4/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct TaskDetailView: View {
    
    let db: Firestore = Firestore.firestore()
    let task: Task
    
    @State private var title: String = ""
    
    var body: some View {
        VStack {
            TextField(task.title, text: $title)
                .textFieldStyle(.roundedBorder)
                .border(.black)
                .padding()
            Button("Update") {
                updateTask()
            }
            .buttonStyle(.bordered)
        }
    }
    
    private func updateTask() {
        db.collection("tasks")
            .document(task.id!)
            .updateData([
                "title": title
            ]) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Document has been updated")
                }
            }
        
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task(id: "123", title: "Test Task"))
    }
}
