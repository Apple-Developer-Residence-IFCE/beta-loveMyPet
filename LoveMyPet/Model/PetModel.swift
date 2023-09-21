//
//  PetModel.swift
//  LoveMyPet
//
//  Created by userext on 25/07/23.
//

import Foundation
import CoreData

enum Race: String, Codable, CaseIterable {
    case naoEsc = "Não escolhida"
    case siamese = "Siamese"
    case persian = "Persian"
    case sphinx = "Sphinx"
    case ragdoll = "Ragdoll"
    case britishShorthair = "British Shorthair"
    case bengal = "Bengal"
    case maineCoon = "Maine Coon"
    case poodle = "Poodle"
    case labrador = "Labrador Retriever"
    case beagle = "Beagle"
    case bulldog = "Bulldog"
    case germanShepherd = "German Shepherd"
    case goldenRetriever = "Golden Retriever"
    case dachshund = "Dachshund"
    case siberianHusky = "Siberian Husky"
    case papagaio = "Papagaio"
    case canario = "Canário"
    case pardal = "Pardal"
    case calopsita = "Calopsita"
    case agapornis = "Agapornis"
    case cockatiel = "Cockatiel"
    case periquitoAustraliano = "Periquito Australiano"
    case hollandLop = "Holland Lop"
    case lopEared = "Lop Eared"
    case angora = "Angora"
    case rex = "Rex"
    case californian = "Californian"
    case flemishGiant = "Flemish Giant"
    case lionhead = "Lionhead"
    case netherlandDwarf = "Netherland Dwarf"
    case syrian = "Syrian"
    case dwarf = "Dwarf"
    case roborovski = "Roborovski"
    case campbellRussian = "Campbell Russian"
    case chinese = "Chinese"
    case russian = "Russian"
    case teddyBear = "Teddy Bear"
    case angoran = "Angoran"
    case tartarugaDeOrelhaVermelha = "Tartaruga de Orelha Vermelha"
    case tartarugaDeCaixa = "Tartaruga de Caixa"
    case tartarugaPintada = "Tartaruga Pintada"
    case tartarugaLeopardo = "Tartaruga Leopardo"
    case tartarugaMordedora = "Tartaruga Mordedora"
    case tartarugaSulcata = "Tartaruga Sulcata"
    case tartarugaAfricana = "Tartaruga Africana"
    case tartarugaAgrionemys = "Tartaruga Agrionemys"
    case puroSangue = "Puro Sangue"
    case quartoDeMilha = "Quarto de Milha"
    case clydesdale = "Clydesdale"
    case andalusian = "Andalusian"
    case appaloosa = "Appaloosa"
    case morgan = "Morgan"
    case saddlebred = "Saddlebred"
    case fjord = "Fjord"
    case other = "Outros"

    var description: String {
        return self.rawValue
    }
}

enum Species: String, Codable, CaseIterable {
    case naoEsc = "Não escolhida"
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
        case .naoEsc:
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
