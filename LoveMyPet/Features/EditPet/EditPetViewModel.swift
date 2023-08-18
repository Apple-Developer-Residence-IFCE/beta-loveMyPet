import Foundation
import SwiftUI








class EditPetViewModel: ObservableObject {
    @Environment(\.managedObjectContext) var pet2
    @ObservedObject var pet: Pet
    
    init(pet: Pet){
        self.pet = pet
    }
    
    
    
//    func saveEditPet() {
//        if pet.hasChanges {
//            do {
//                try viewContext.save()
//            } catch {
//                print ("Erro ao salvar o animal: \(error.localizedDescription)")
//            }
//        }
    }

