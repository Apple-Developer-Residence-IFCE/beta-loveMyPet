//
//  ContentView.swift
//  LoveMyPet
//
//  Created by userext on 17/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//    func savePet() {
//        var newPet: Pet
//        if let editPet = editPet {
//            newPet = editPet
//        } else {
//            newPet = Pet(context: stack.viewContext)
//            newPet.id = UUID()
//        }
//        newPet.name = name
//        newPet.race = race.description
//        newPet.species = species.description
//        newPet.age = age
//        newPet.weight = weight
//        newPet.castrated = castrated.description
//        newPet.gender = gender.description
//        newPet.image = image
//        do {
//            try stack.viewContext.save()
//        } catch let error as NSError {
//            print("Erro ao salvar pet: \(error), \(error.userInfo)")
//        }
//    }
