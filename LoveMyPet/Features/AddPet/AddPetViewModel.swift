//
//  AddPetViewModel.swift
//  LoveMyPet
//
//  Created by userext on 08/08/23.
//

import Foundation
import CoreData

class PetViewModel: ObservableObject {
     let managedObjectContext: NSManagedObjectContext
    @Published private var showingSheet = false
    @Published var isView: Bool = false
    @Published var selectedSpecies: String = "Dog"
        @Published var name: String = ""
        @Published var race: String = ""
        @Published var birth: Date = Date()
        @Published var age: Int = 0
        @Published var weight: Float = 0.0
        @Published var castreted: Bool = false
        @Published var gender: Bool = true
        @Published var imagePath: URL? = nil
        init(managedObjectContext: NSManagedObjectContext) {
            self.managedObjectContext = managedObjectContext
        }
}




//class PetViewModel {
//    var stack: CoreDataStack
//    private var editPet: Pet?
//    @Published var name: String = ""
//    @Published var species: String = ""
//    @Published var date: Date = Date()
//    @Published var race: String = ""
//    @Published var weight: Float = 0
//    @Published var registered: Bool = false
//    @Published var imagepath: URL? = URL(string: "")
//    @Published var castrated: Bool = false
//    var hasError: Bool = false
//    init(stack: CoreDataStack, editPet: Pet? = nil) {
//        self.stack = stack
//    }
//
//    func delete() {
//        do {
//            if let editPet = editPet {
//                stack.context.delete(editPet)
//                do {
//                    try stack.context.save()
//                    print("Pet deletado")
//                } catch {
//                    print("Error ao salvar depois da deleção \(error)")
//                }
//            }
//            else {
//                hasError = true
//            }
//
//        }
//    }
//    func save() {
//        var pet: Pet
//        if let editPet = editPet {
//            pet = editPet
//        } else {
//            pet = Pet(context: stack.viewContext)
//            pet.id = UUID()
//        }
//        pet.name = name
//        pet.species = species
//        pet.date = date
//        pet.race = race
//        pet.weight = weight
//        pet.registered = registered
//        pet.imagepath = imagepath
//        pet.castrated = castrated
//        do {
//            try stack.viewContext.save()
//        } catch {
//            print("Error para salvar o pet: \(error)")
//            hasError = true
//        }
//    }
//}
