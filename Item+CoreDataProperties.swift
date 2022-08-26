//
//  Item+CoreDataProperties.swift
//  Catwiki
//
//  Created by  Mr.Ki on 20.08.2022.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var breedExplaination: String?
    @NSManaged public var energyLevel: Int64
    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var isHairless: Bool
    @NSManaged public var name: String?
    @NSManaged public var temperament: String?
    @NSManaged public var date: Date?

}

extension Item : Identifiable {

}
