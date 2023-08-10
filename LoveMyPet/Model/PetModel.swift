//
//  PetModel.swift
//  LoveMyPet
//
//  Created by userext on 25/07/23.
//

import Foundation
import CoreData

struct PetPresenter {
    let managedObjectContext: NSManagedObjectContext
    var uuid: UUID
    var name: String
    var race: String
    var birth: Date
    var species: String
    var age: Int
    var weight: Float
    var castreted: Bool
    var gender: Bool
    var imagePath: URL
    
    func savePet(context: NSManagedObjectContext) {
        let newPet = Pet(context: context)
        newPet.uuid = uuid
        newPet.name = name
        newPet.race = race
        newPet.birth = birth
        newPet.species = species
        newPet.age = age
        newPet.weight = weight
        newPet.castreted = castreted
        newPet.gender = gender
        newPet.imagePath = imagePath
        do {
            try context.save()
        } catch let error as NSError {
            print("Erro ao salvar pet: \(error), \(error.userInfo)")
        }
    }
}
