//
//  PetActivityItem+CoreDataProperties.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 11/06/23.
//
//

import Foundation
import CoreData

extension PetActivityItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetActivityItem> {
        return NSFetchRequest<PetActivityItem>(entityName: "PetActivityItem")
    }

    @NSManaged public var imageActivity: Data?
    @NSManaged public var dateActivity: Date?
    @NSManaged public var descriptionActivity: String?
    @NSManaged public var pets: PetsItem?

    public var unWrappedDescription: String {
        descriptionActivity ?? "Unknown"
    }

}

extension PetActivityItem: Identifiable {

}
