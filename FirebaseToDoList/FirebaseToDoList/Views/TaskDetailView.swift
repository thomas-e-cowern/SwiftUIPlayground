//
//  TaskDetailView.swift
//  FirebaseToDoList
//
//  Created by Thomas Cowern on 11/4/22.
//

import SwiftUI

struct TaskDetailView: View {
    
    let task: Task
    
    var body: some View {
        Text(task.title)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task(title: "Test Task"))
    }
}
