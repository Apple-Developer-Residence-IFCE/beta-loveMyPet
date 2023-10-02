//
//  SwiftUiTeste.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct EditPetView: View {
    @EnvironmentObject var viewModel: PetViewModel
    @Environment(\.dismiss) var dismiss
    @State var isView: Bool = false
    @State var showingAlert : Bool = false
    @State private var showingSheet = false
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
                    .padding(.bottom, 65)
                Button(action: {
                    
                }, label: {
                    Text("Excluir cadastro")
                        .foregroundColor(.white)
                        .frame(width: 327, height: 48)
                        .background(Color("delete"))
                        .cornerRadius(10)
                })
                .padding(.top, -10)
                
            }
            .background(Color("background"))
            .background(.clear)
            .scrollContentBackground(.hidden)
        }
    }
}
struct EditPetView_Previews: PreviewProvider {
    static var previews: some View {
        EditPetView()
            .environmentObject(PetViewModel(stack: .shared))
    }
}
