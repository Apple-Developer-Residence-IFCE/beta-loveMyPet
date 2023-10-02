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
    private var editPet: Pet?
    @Published var editBool: Bool = false
    @Published var savedPets: [Pet] = []
    @Published var name: String = ""
    @Published var gender: GenderModel = GenderModel.none
    @Published var race: Race = .naoEsc
    @Published var age: Date = Date()
    @Published var formattedAge: Date = Date()
    @Published var weight: Double = 0.0
    @Published var image: URL? = URL(string: "")
    @Published var castrated: IsCastrated = .isNot
    @Published var availableRaces: [Race] = [.naoEsc]
    @Published var quilos: Int = 0
    @Published var grama: Int = 0
    @Published var species: Species = .naoEsc {
        didSet {
            availableRaces = racesForSpecies(species)
            race = .naoEsc
        }
    }
    init(stack: CoreDataStack, editPet: Pet? = nil) {
        self.stack = stack
        self.editPet = editPet
    }
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
    
    func racesForSpecies(_ especie: Species) -> [Race] {
        switch especie {
        case .naoEsc:
            return [.naoEsc]
        case .cat:
            return [.naoEsc, .siamese, .persian, .maineCoon, .sphinx, .ragdoll, .britishShorthair, .bengal, .other]
        case .dog:
            return [.naoEsc, .poodle, .labrador, .beagle, .bulldog, .germanShepherd, .goldenRetriever, .dachshund, .siberianHusky, .other]
        case .bird:
            return [.naoEsc, .papagaio, .canario, .pardal, .calopsita, .agapornis, .cockatiel, .periquitoAustraliano, .agapornis, .other]
        case .rabit:
            return [.naoEsc, .hollandLop, .lopEared, .angora, .rex, .californian, .flemishGiant, .lionhead, .netherlandDwarf, .other]
        case .hamster:
            return [.naoEsc, .syrian, .dwarf, .roborovski, .campbellRussian, .chinese, .russian, .teddyBear, .angoran, .other]
        case .turtle:
            return [.naoEsc, .tartarugaDeOrelhaVermelha, .tartarugaLeopardo, .tartarugaMordedora,
                    .tartarugaSulcata, .tartarugaAfricana, .tartarugaAgrionemys, .other]
        case .horse:
            return [.naoEsc, .puroSangue, .quartoDeMilha, .clydesdale, .andalusian, .appaloosa, .morgan, .saddlebred, .fjord, .other]
        default:
            return []
        }
    }
    func saveEditPet() {
        if ((editPet?.hasChanges) != nil) {
            do {
                try stack.viewContext.save()
                refreshCard()
            } catch {
                print ("Erro ao salvar o animal: \(error.localizedDescription)")
            }
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
                    print("Error ao salvar depois da deleção \(error)") }
            } else {
                print("error")
            }
        }
    }
    func pickerClear() {
        name = ""
        species = Species.naoEsc
        race = Race.naoEsc
        weight = 0.0
        castrated = IsCastrated.isNot
        gender = GenderModel.none
        DispatchQueue.main.async {
            self.age = Date()
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
        pet.race = race.description
        pet.weight = Double(quilos) + Double(grama) / 10.0
        pet.image = image
        pet.castrated = castrated.description
        pet.gender = gender.description
        do {
            try stack.viewContext.save()
            refreshCard()
        } catch {
            print("Error para salvar o pet: \(error)")
        }
    }
    func refreshCard () {
        guard let editPet = editPet,
              let index = savedPets.firstIndex(where: {$0.id! == editPet.id!})
        else { return }
        savedPets.remove(at: index)
        savedPets.append(editPet)
    }
    func fetchPets() {
        let request = NSFetchRequest<Pet>(entityName: "Pet")
        do {
            savedPets = try stack.viewContext.fetch(request)
        } catch let error {
            print("error fetching. \(error)")
        }
    }
    func selectedPet(_ pet: Pet) {
        self.editPet = pet
        self.name = pet.name ?? ""
        self.weight = pet.weight
        self.quilos = Int(pet.weight)
        self.grama = Int((pet.weight - Double(quilos)) * 10 )
        self.age = pet.age ?? Date()
        self.castrated = IsCastrated(rawValue: pet.castrated ?? IsCastrated.isNot.description) ?? IsCastrated.isNot
        self.gender = GenderModel(rawValue: pet.gender ?? GenderModel.none.description) ?? GenderModel.none
        self.species = Species(rawValue: pet.species ?? Species.naoEsc.description) ?? Species.naoEsc
        self.race = Race(rawValue: pet.race ?? Race.naoEsc.description) ?? Race.naoEsc
        self.image = pet.image
    }
}


