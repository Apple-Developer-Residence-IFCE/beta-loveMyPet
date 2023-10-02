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
                ImagePicker(avatarImage: $viewModel.image)
                    .padding(.top, 20)
                List {
                        PickerText(textInput: "Nome do Pet", petName: $viewModel.name)
                            .listRowBackground(Color("editPetPicker"))
                        Pickers(title: "Gênero", selectedValue: $viewModel.gender, options: GenderModel.allCases)
                            .listRowBackground(Color("editPetPicker"))
                        Pickers(title: "Espécie", selectedValue: $viewModel.species, options: Species.allCases)
                            .listRowBackground(Color("editPetPicker"))
                        Pickers(title: "Raça", selectedValue: $viewModel.race, options: viewModel.availableRaces)
                            .pickerStyle(.navigationLink)
                            .listRowBackground(Color("editPetPicker"))
                        DatePicker("Nascimento", selection: $viewModel.age, displayedComponents: .date)
                            .environment(\.locale, Locale.init(identifier: "pt"))
                            .listRowBackground(Color("editPetPicker"))
                }
                ExtraPickers()
                    .environmentObject(viewModel)
                    .padding(.top, -35)
            }
            .background(Color("background"))
            .background(.clear)
            .scrollContentBackground(.hidden)
        }
    }
}
struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView(viewModel: PetViewModel(stack: .shared))
    }
}
