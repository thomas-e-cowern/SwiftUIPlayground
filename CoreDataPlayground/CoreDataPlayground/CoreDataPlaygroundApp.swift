//
//  CoreDataPlaygroundApp.swift
//  CoreDataPlayground
//
//  Created by Thomas Cowern New on 2/23/22.
//

import SwiftUI

@main
struct CoreDataPlaygroundApp: App {
    
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
