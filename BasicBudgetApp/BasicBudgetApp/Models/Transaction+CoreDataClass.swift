//
//  Transaction+CoreDataClass.swift
//  BasicBudgetApp
//
//  Created by Thomas Cowern on 10/19/22.
//

import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {
    
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
    
}
