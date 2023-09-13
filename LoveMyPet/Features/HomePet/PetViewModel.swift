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
    @Published var gender: GenderModel = GenderModel.none
    @Published var race: Race = .naoEsc
    @Published var age: Date = Date()
    @Published var weight: Double = 0.0
    @Published var image: URL? = URL(string: "")
    @Published var castrated: Bool = false
    @Published var availableRaces: [Race] = [.naoEsc]
    @Published var quilos: Int = 0
    @Published var grama: Int = 0
    @Published var species: Species = .none {
        didSet {
            availableRaces = racesForSpecies(species)
            race = .naoEsc
        }
    }
    init(stack: CoreDataStack, editPet: Pet? = nil) {
        self.stack = stack
    }
    func setWeight(kg: Int, gramas: Int) -> Double {
        let x = Double(kg) + Double(gramas) / 10.0
        weight = x
        return weight
    }
    func racesForSpecies(_ especie: Species) -> [Race] {
        switch especie {
        case .cat:
            return [.siamese, .persian, .maineCoon, .sphinx, .ragdoll, .britishShorthair, .bengal, .other]
        case .dog:
            return [.poodle, .labrador, .beagle, .bulldog, .germanShepherd, .goldenRetriever, .dachshund, .siberianHusky, .other]
        case .bird:
            return [.papagaio, .canario, .pardal, .calopsita, .agapornis, .cockatiel, .periquitoAustraliano, .agapornis, .other]
        case .rabit:
            return [.hollandLop, .lopEared, .angora, .rex, .californian, .flemishGiant, .lionhead, .netherlandDwarf, .other]
        case .hamster:
            return [.syrian, .dwarf, .roborovski, .campbellRussian, .chinese, .russian, .teddyBear, .angoran, .other]
        case .turtle:
            return [.tartarugaDeOrelhaVermelha, .tartarugaDeCaixa, .tartarugaPintada, .tartarugaLeopardo, .tartarugaMordedora, .tartarugaSulcata, .tartarugaAfricana, .tartarugaAgrionemys, .other]
        case .horse:
            return [.puroSangue, .quartoDeMilha, .clydesdale, .andalusian, .appaloosa, .morgan, .saddlebred, .fjord, .other]
        default:
            return []
        }
    }
    
    func savePet() {
        let newPet = Pet(context: stack.viewContext)
        newPet.name = name
        newPet.race = race.rawValue
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
        pet.race = race.rawValue
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
