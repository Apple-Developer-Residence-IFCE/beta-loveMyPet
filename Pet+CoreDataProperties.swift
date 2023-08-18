//
//  Pet+CoreDataProperties.swift
//  LoveMyPet
//
//  Created by userext on 16/08/23.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var age: Int64
    @NSManaged public var birth: Date?
    @NSManaged public var castrated: Bool
    @NSManaged public var gender: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var race: String?
    @NSManaged public var species: String?
    @NSManaged public var weight: Double

}

extension Pet : Identifiable {

}