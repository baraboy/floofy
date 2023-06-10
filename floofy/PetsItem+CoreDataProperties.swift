//
//  PetsItem+CoreDataProperties.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 10/06/23.
//
//

import Foundation
import CoreData


extension PetsItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetsItem> {
        return NSFetchRequest<PetsItem>(entityName: "PetsItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image_pets: Data?
    @NSManaged public var name_pets: String?
    @NSManaged public var pet_category: String?
    @NSManaged public var reminder: NSSet?
    
    public var reminderArray: [ReminderItem] {
        let reminderSet = reminder as? Set<ReminderItem> ?? []
        
        return reminderSet.sorted {
            $0.unWrappedLabel < $1.unWrappedLabel
        }
    }

}

// MARK: Generated accessors for reminder
extension PetsItem {

    @objc(addReminderObject:)
    @NSManaged public func addToReminder(_ value: ReminderItem)

    @objc(removeReminderObject:)
    @NSManaged public func removeFromReminder(_ value: ReminderItem)

    @objc(addReminder:)
    @NSManaged public func addToReminder(_ values: NSSet)

    @objc(removeReminder:)
    @NSManaged public func removeFromReminder(_ values: NSSet)

}

extension PetsItem : Identifiable {

}
