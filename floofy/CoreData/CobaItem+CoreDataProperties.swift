//
//  CobaItem+CoreDataProperties.swift
//  floofy
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 11/06/23.
//
//

import Foundation
import CoreData

extension CobaItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CobaItem> {
        return NSFetchRequest<CobaItem>(entityName: "CobaItem")
    }

    @NSManaged public var imageGrooming: Data?
    @NSManaged public var dateGrooming: Date?
    @NSManaged public var descriptionGrooming: String?
    @NSManaged public var pets: PetsItem?
    public var unWrappedDescription: String {
        descriptionGrooming ?? "Unknown"
    }

}

extension CobaItem: Identifiable {

}
