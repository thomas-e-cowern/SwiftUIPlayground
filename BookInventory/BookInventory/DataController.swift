//
//  DataController.swift
//  BookInventory
//
//  Created by Thomas Cowern New on 5/23/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "BookInventory")
    
    init () {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
