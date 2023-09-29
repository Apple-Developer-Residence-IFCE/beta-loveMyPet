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
