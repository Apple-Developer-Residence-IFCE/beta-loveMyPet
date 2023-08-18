//
//  PetModel.swift
//  LoveMyPet
//
//  Created by userext on 25/07/23.
//

import Foundation
import CoreData

enum GenderModel: String, Codable, CaseIterable {
    case none = "Nenhum"
    case male = "Macho"
    case female = "Fêmea"
    var description: String {
        switch self {
        case .male:
            return "Macho"
        case .female:
            return "Fêmea"
        case .none:
            return "Nenhum"
        }
    }
}
struct PetModel: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var race: String = ""
    var birth: Date = Date.now
    var species: String = ""
    var age: Int = 0
    var weight: Double = 0.0
    var castrated: Bool = false
    var gender: GenderModel = GenderModel.none
    var image: Data? = Data()
    init(uuid: UUID = UUID(), name: String = "", race: String = "",
         birth: Date = Date.now, species: String = "",
         age: Int = 0, weight: Double = 0.0,castrated: Bool = false,
         gender: GenderModel = GenderModel.none, image: Data? = Data()) {
        self.id = uuid
        self.name = name
        self.race = race
        self.birth = birth
        self.species = species
        self.age = age
        self.weight = weight
        self.castrated = castrated
        self.gender = gender
        self.image = image
    }
    
    init(petEntity: Pet?) {
        self.image = petEntity?.image ?? Data()
        self.id = petEntity?.id ?? .init()
        self.name = petEntity?.name ?? ""
        self.gender = GenderModel(rawValue: petEntity?.gender ?? "") ?? .none
        self.species = petEntity?.species ?? ""
        self.race = petEntity?.race ?? ""
        self.birth = petEntity?.birth ?? .now
        self.weight = petEntity?.weight ?? 0
        self.castrated = petEntity?.castrated ?? false
    }
}
//    func savePet() {
//        let newPet = Pet(context: viewContext)
//        newPet.id = uuid
//        newPet.name = name
//        newPet.race = race
//        newPet.birth = birth
//        newPet.species = species
//        newPet.age = age
//        newPet.weight = weight
//        newPet.castreted = castreted
//        newPet.gender = gender
//        newPet.image = image
//        do {
//            try viewContext.save()
//        } catch let error as NSError {
//            print("Erro ao salvar pet: \(error), \(error.userInfo)")
//        }
//    }
