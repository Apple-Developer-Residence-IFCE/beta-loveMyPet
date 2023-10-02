import SwiftUI

struct EditPetView: View {
    @EnvironmentObject var viewModel: PetViewModel
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                    ImagePicker()
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
                    self.showingAlert = true
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
                        title: Text("Deseja excluir o cadastro?"),
                        message: Text("Uma vez excluída, essa ação não pode ser desfeita."),
                        primaryButton: .destructive(Text("Excluir")) {
                            viewModel.delete()
                            dismiss()
                        },
                        secondaryButton: .cancel(Text("Cancelar"))
                    )
                }
            }.background(Color("background"))
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
