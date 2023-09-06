//
//  PetModel.swift
//  LoveMyPet
//
//  Created by userext on 25/07/23.
//

import Foundation
import CoreData



//struct SpeciesRace {
//    static func races(forSpecies species: Species) -> [Race] {
//        switch species {
//        case .cat:
//            return [.none, .siamese, .persian, .maineCoon]
//        case .dog:
//            return [.none, .poodle, .labrador, .beagle, .bulldog, .germanShepherd, .goldenRetriever]
//        // Adicione mais casos para outras espécies conforme necessário
//        default:
//            return [.none, .other]
//        }
//    }
//}
enum Race: String, Codable, CaseIterable {
    case none = "Não escolhida"
    case siamese = "Siamese"
    case persian = "Persian"
    case maineCoon = "Maine Coon"
    case poodle = "Poodle"
    case labrador = "Labrador Retriever"
    case beagle = "Beagle"
    case bulldog = "Bulldog"
    case germanShepherd = "German Shepherd"
    case goldenRetriever = "Golden Retriever"
    case other = "Outros"
    
    var description: String {
        return self.rawValue
    }
}
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
enum Species: String, Codable, CaseIterable {
    case none = "Não escolhida"
    case cat = "Gato"
    case bird = "Pássaro"
    case dog = "Cachorro"
    case rabit = "Coelho"
    case hamster = "Hamester"
    case turtle = "Tartaruga"
    case horse = "Cavalo"
    case other = "Outros"
    var description: String {
        switch self {
        case .none:
            return "Não escolhida"
        case .cat:
            return "Gato"
        case .bird:
            return "Pássaro"
        case .dog:
            return "Cachorro"
        case .rabit:
            return "Coelho"
        case .hamster:
            return "Hamester"
        case .turtle:
            return "Tartaruga"
        case .horse:
            return "Cavalo"
        case .other:
            return "Outros"
        }
    }
}
//struct PetModel: Codable, Identifiable {
//    var id: UUID = UUID()
//    var name: String = ""
//    var race: String = ""
//    var birth: Date = Date.now
//    var species: Species = Species.none
//    var age: Int = 0
//    var weight: Double = 0.0
//    var castrated: Bool = false
//    var gender: GenderModel = GenderModel.none
//    var image: Data? = Data()
//    init(uuid: UUID = UUID(), name: String = "",
//         race: String = "", birth: Date = Date.now, species: Species = Species.none, age: Int = 0,
//         weight: Double = 0.0, castrated: Bool = false, gender: GenderModel = GenderModel.none, image: Data? = Data()) {
//        self.id = uuid
//        self.name = name
//        self.race = race
//        self.birth = birth
//        self.species = species
//        self.age = age
//        self.weight = weight
//        self.castrated = castrated
//        self.gender = gender
//        self.image = image
//    }
//    init(petEntity: Pet?) {
//        self.image = petEntity?.image ?? Data()
//        self.id = petEntity?.id ?? .init()
//        self.name = petEntity?.name ?? ""
//        self.gender = GenderModel(rawValue: petEntity?.gender ?? "") ?? .none
//        self.species = Species(rawValue: petEntity?.species ?? "") ?? .none
//        self.race = petEntity?.race ?? ""
//        self.birth = petEntity?.birth ?? .now
//        self.weight = petEntity?.weight ?? 0
//        self.castrated = petEntity?.castrated ?? false
//    }
//    func savePet() {
//        let newPet = Pet(context: .viewContext)
//        newPet.id = UUID
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
//}
//
//extension PetModel: Equatable {
//    static func == (lhs: PetModel, rhs: PetModel) -> Bool {
//        return lhs.image == rhs.image &&
//        lhs.name == rhs.name &&
//        lhs.gender == rhs.gender &&
//        lhs.species == rhs.species &&
//        lhs.race == rhs.race &&
//        lhs.birth == rhs.birth &&
//        lhs.weight == rhs.weight &&
//        lhs.castrated == rhs.castrated
//    }
//    static func != (lhs: PetModel, rhs: PetModel) -> Bool {
//        return !(lhs == rhs)
//    }
//}
//
////    func savePet() {
////        let newPet = Pet(context: viewContext)
////        newPet.id = uuid
////        newPet.name = name
////        newPet.race = race
////        newPet.birth = birth
////        newPet.species = species
////        newPet.age = age
////        newPet.weight = weight
////        newPet.castreted = castreted
////        newPet.gender = gender
////        newPet.image = image
////        do {
////            try viewContext.save()
////        } catch let error as NSError {
////            print("Erro ao salvar pet: \(error), \(error.userInfo)")
////        }
////    }
//
//
////import CoreData
////
////class Pet: NSManagedObject {
////    @NSManaged var name: String
////    @NSManaged var birthdate: Date
////    @NSManaged var weight: Double
////}
