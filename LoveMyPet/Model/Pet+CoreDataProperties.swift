//
//  Pet+CoreDataProperties.swift
//  LoveMyPet
//
//  Created by userext on 28/07/23.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var age: Int
    @NSManaged public var birth: Date?
    @NSManaged public var castreted: Bool
    @NSManaged public var gender: Bool
    @NSManaged public var name: String?
    @NSManaged public var race: String?
    @NSManaged public var species: String?
    @NSManaged public var uuid: UUID?
    @NSManaged public var weight: Float

}

extension Pet : Identifiable {

}
