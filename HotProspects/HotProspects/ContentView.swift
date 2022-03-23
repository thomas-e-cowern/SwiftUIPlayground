//
//  ContentView.swift
//  HotProspects
//
//  Created by Thomas Cowern New on 3/23/22.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init () {
        for i in 1...100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ContentView: View {
    
//    @State private var output = ""
//    @State private var backgroundColor = Color.red
//    @StateObject private var updater = DelayedUpdater()
//    static let tag = "ContentView"
//    @StateObject var user = User()
//    @State private var selectedTab = "One"
    
    var body: some View {
        
        
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button (role: .destructive) {
                        print("Holy")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions (edge: .leading) {
                    Button {
                        print("Smokes")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
