//
//  PetViewModel.swift
//  LoveMyPet
//
//  Created by userext on 11/08/23.
//

import Foundation
import CoreData

class PetViewModel: ObservableObject {
    let stack: CoreDataStack
    var editPet: Pet?
    @Published var savedPets: [Pet] = []
    @Published var name: String = ""
    @Published var species: Species = Species.none
    @Published var age: Int64 = 0
    @Published var race: String = ""
    @Published var weight: Double = 0.0
    @Published var registered: Bool = false
    @Published var image: URL? = URL(string: "")
    @Published var castrated: Bool = false
    @Published var gender: GenderModel = GenderModel.none
    init(stack: CoreDataStack, editPet: Pet? = nil) {
        self.stack = stack
    }
    func savePet() {
        let newPet = Pet(context: stack.viewContext)
        newPet.name = name
        newPet.race = race
        newPet.species = species.description
        newPet.age = age
        newPet.weight = weight
        newPet.castrated = castrated
        newPet.gender = gender.description
        newPet.image = image
        do {
            try stack.viewContext.save()
        } catch let error as NSError {
            print("Erro ao salvar pet: \(error), \(error.userInfo)")
        }
    }
    func delete() {
        do {
            if let editPet = editPet {
                stack.viewContext.delete(editPet)
                do {
                    try stack.viewContext.save()
                    print("Pet deletado")
                } catch {
                    print("Error ao salvar depois da deleção \(error)")
                }
            }
            else {
                print("error")
            }
        }
    }
    func save() {
        var pet: Pet
        if let editPet = editPet {
            pet = editPet
        } else {
            pet = Pet(context: stack.viewContext)
            pet.id = UUID()
        }
        pet.name = name
        pet.species = species.description
        pet.age = age
        pet.race = race
        pet.weight = weight
        pet.image = image
        pet.castrated = castrated
        pet.gender = gender.description
        do {
            try stack.viewContext.save()
        } catch {
            print("Error para salvar o pet: \(error)")
        }
    }
}
//    func saveEditPet() {
//        if pet.hasChanges {
//            do {
//                try viewContext.save()
//            } catch {
//                print ("Erro ao salvar o animal: \(error.localizedDescription)")
//            }
//        }
