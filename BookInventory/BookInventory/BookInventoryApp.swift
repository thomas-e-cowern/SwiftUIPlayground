//
//  BookInventoryApp.swift
//  BookInventory
//
//  Created by Thomas Cowern New on 5/23/22.
//

import SwiftUI

@main
struct BookInventoryApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
