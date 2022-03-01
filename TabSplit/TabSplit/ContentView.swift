//
//  ContentView.swift
//  TabSplit
//
//  Created by Thomas Cowern New on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    
//    @State var tapCount = 0
//    @State private var name: String = ""

    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
//            Form {
//                Text("Hello, world!")
//
//                Button {
//                    self.tapCount += 1
//                } label: {
//                    Text("Tap Count \(tapCount)")
//                }
//
//            }
//            .navigationTitle("Tab Split")
//            .navigationBarTitleDisplayMode(.inline)
        
            Form {
//                TextField("Enter your name", text: $name)
//                Text("Hello, \(name)")
                
//                ForEach(0..<100) {
//                    Text("Row \($0)")
//                }
                
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
            }
            .navigationTitle("Tab Split")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
