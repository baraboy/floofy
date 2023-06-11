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

    @NSManaged public var image_coba: Data?
    @NSManaged public var date_coba: Date?
    @NSManaged public var description_coba: String?
    @NSManaged public var pets: PetsItem?
    
    public var unWrappedDescription: String {
        description_coba ?? "Unknown"
    }

}

extension CobaItem : Identifiable {

}
