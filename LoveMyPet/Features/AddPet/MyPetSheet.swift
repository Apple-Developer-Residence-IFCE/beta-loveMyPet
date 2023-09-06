//
//  MyPetSheet.swift
//  LoveMyPet
//
//  Created by userext on 31/08/23.
//

import SwiftUI

struct MyPetSheet: View {
    @ObservedObject var viewModel: PetViewModel
    var body: some View {
        VStack {
            ImagePicker()
            Group {
                VStack {
                    Pickers(title: "Gênero", selectedValue: $viewModel.gender, options: GenderModel.allCases)
                    Pickers(title: "Espécie", selectedValue: $viewModel.species, options: Species.allCases)
                    //                    Pickers(title: "Raça", selectedValue: $viewModel.race, options: ))
                }
            }
        }
    }
}

struct MyPetSheet_Previews: PreviewProvider {
    static var previews: some View {
        MyPetSheet(viewModel: PetViewModel(stack: CoreDataStack()))
    }
}
