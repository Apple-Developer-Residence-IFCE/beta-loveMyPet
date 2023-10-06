//
//  SwiftUiTeste.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct EditPetSheet: View {
    @EnvironmentObject var viewModel: PetViewModel
    @Environment(\.dismiss) var dismiss
    @State var isView: Bool = false
    @State var showingAlert: Bool = false
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
                        .listRowBackground(Color("editPetPicker"))
                        .pickerStyle(.navigationLink)
                    DatePicker("Nascimento", selection: $viewModel.age, displayedComponents: .date)
                        .environment(\.locale, Locale.init(identifier: "pt"))
                        .listRowBackground(Color("editPetPicker"))
                }
                ExtraPickers()
                    .environmentObject(viewModel)
                    .padding(.bottom, 65)
                Button(action: {
                    showingAlert = true
                }, label: {
                    Text("Excluir cadastro")
                        .foregroundColor(.white)
                        .frame(width: 327, height: 48)
                        .background(Color("delete"))
                        .cornerRadius(10)
                })
                .padding(.top, -10)
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Deseja excluir o cadrstro?"),
                        message: Text("Uma vez excluida, essa ação não pode ser desfeita."),
                        primaryButton: .destructive(Text("Excluir")) {
                            viewModel.delete()
                            dismiss()
                        },
                        secondaryButton: .cancel(Text("Cancelar"))
                    )
                }
            }
            .background(Color("background"))
            .background(.clear)
            .scrollContentBackground(.hidden)
        }
    }
}
struct EditPetView_Previews: PreviewProvider {
    static var previews: some View {
        EditPetSheet()
            .environmentObject(PetViewModel(stack: .shared))
    }
}
