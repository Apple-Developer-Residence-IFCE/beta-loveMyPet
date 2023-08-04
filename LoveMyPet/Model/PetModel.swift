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

    func saveToCoreData(context: NSManagedObjectContext) {
            let petEntity = Pet(context: context)
            petEntity.uuid = uuid
            petEntity.name = name
            petEntity.race = race
            petEntity.birth = birth
            petEntity.species = species
            petEntity.age = age
            petEntity.weight = weight
            petEntity.castreted = castreted
            petEntity.gender = gender
            petEntity.imagePath = imagePath
            do {
                try context.save()
            } catch let error as NSError {
                print("Erro ao salvar pet: \(error), \(error.userInfo)")
            }
        }
}
