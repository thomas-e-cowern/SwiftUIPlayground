//
//  Lists.swift
//  SwiftUIReminders
//
//  Created by Thomas Cowern on 12/22/22.
//

import Foundation
import CoreData
import AppKit

@objc(Lists)
class Lists: NSManagedObject {
    
}

extension Lists {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lists> {
        return NSFetchRequest<Lists>(entityName: "Lists")
    }

    @NSManaged public var color: NSColor?
    @NSManaged public var name: String?

}

extension Lists : Identifiable {

}
