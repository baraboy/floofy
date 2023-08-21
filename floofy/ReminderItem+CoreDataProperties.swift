//
//  ReminderItem+CoreDataProperties.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 11/06/23.
//
//

import Foundation
import CoreData

extension ReminderItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReminderItem> {
        return NSFetchRequest<ReminderItem>(entityName: "ReminderItem")
    }

    @NSManaged public var dateReminder: Date?
    @NSManaged public var label: String?
    @NSManaged public var repeatReminder: String?
    @NSManaged public var pets: PetsItem?
    public var unWrappedLabel: String {
        label ?? "Unknown"
    }

}

extension ReminderItem: Identifiable {

}
