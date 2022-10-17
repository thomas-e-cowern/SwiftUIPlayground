//
//  CoreDataManager.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/17/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private var persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "BudgetModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                    fatalError("Unable to initialize Core Data Stack; \(error)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
}
