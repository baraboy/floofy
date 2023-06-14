//
//  PetsItem+CoreDataProperties.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 11/06/23.
//
//

import Foundation
import CoreData
import UIKit


extension PetsItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetsItem> {
        return NSFetchRequest<PetsItem>(entityName: "PetsItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image_pets: Data?
    @NSManaged public var name_pets: String?
    @NSManaged public var pet_category: String?
    @NSManaged public var reminder: NSSet?
    @NSManaged public var activity: NSSet?
    
//    public var unWrappedImagePets: Data {
//        
//        let imageData = image_pets.
//        
//        image_pets ?? UIImage(named: "addImage")
//    }
    
    public var reminderArray: [ReminderItem] {
        let reminderSet = reminder as? Set<ReminderItem> ?? []
        
        return reminderSet.sorted{
            $0.unWrappedLabel < $1.unWrappedLabel
        }
    }
    
    public var activityArray: [CobaItem] {
        let reminderSet = activity as? Set<CobaItem> ?? []
        
        return reminderSet.sorted{
            $0.unWrappedDescription < $1.unWrappedDescription
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

// MARK: Generated accessors for activity
extension PetsItem {

    @objc(addActivityObject:)
    @NSManaged public func addToActivity(_ value: CobaItem)

    @objc(removeActivityObject:)
    @NSManaged public func removeFromActivity(_ value: CobaItem)

    @objc(addActivity:)
    @NSManaged public func addToActivity(_ values: NSSet)

    @objc(removeActivity:)
    @NSManaged public func removeFromActivity(_ values: NSSet)

}

extension PetsItem : Identifiable {

}
