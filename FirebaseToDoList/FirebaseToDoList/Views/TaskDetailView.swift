//
//  TaskDetailView.swift
//  FirebaseToDoList
//
//  Created by Thomas Cowern on 11/4/22.
//

import SwiftUI

struct TaskDetailView: View {
    
    let task: Task
    @State private var title: String = ""
    
    var body: some View {
        VStack {
            TextField(task.title, text: $title)
                .textFieldStyle(.roundedBorder)
                .border(.black)
                .padding()
            Button("Update") {
                
            }
            .buttonStyle(.bordered)
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task(title: "Test Task"))
    }
}
