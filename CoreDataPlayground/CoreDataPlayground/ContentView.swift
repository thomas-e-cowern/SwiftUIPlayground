//
//  ContentView.swift
//  CoreDataPlayground
//
//  Created by Thomas Cowern New on 2/23/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK:  Properties
    @Environment(\.managedObjectContext) var managedContext
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstName = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastName = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstName.randomElement()
                let chosenLastName = lastName.randomElement()
                
                let student = Student(context: managedContext)
                student.id = UUID()
                student.name = "\(chosenFirstName ?? "NFN") \(chosenLastName ?? "NLN")"
                
                try? managedContext.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
