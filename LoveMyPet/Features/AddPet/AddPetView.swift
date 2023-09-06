//
//  SwiftUiTeste.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct AddPetView: View {
    @ObservedObject var viewModel: PetViewModel
    var body: some View {
        NavigationStack {
            VStack {
                
                ImagePicker()
                List {
                    Pickers(title: "Gênero", selectedValue: $viewModel.gender, options: GenderModel.allCases)
                    Pickers(title: "Espécie", selectedValue: $viewModel.species, options: Species.allCases)
                    Pickers(title: "Raça", selectedValue: $viewModel.gender, options: GenderModel.allCases)
                }
                .background(Color("background"))
                .background(.clear)
            }
            WeightPickerC(viewM: PetViewModel(stack: .shared))
        }
    }
}
struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView(viewModel: PetViewModel(stack: .shared))
    }
}
