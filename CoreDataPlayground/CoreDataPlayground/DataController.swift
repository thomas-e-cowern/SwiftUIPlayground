//
//  DataController.swift
//  CoreDataPlayground
//
//  Created by Thomas Cowern New on 2/23/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    // MARK:  Properties
    let container = NSPersistentContainer(name: "Bookworm")
    
    // MARK:  Initializer
    init () {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
