import SwiftUI

struct EditPetSheet: View {
    @EnvironmentObject private var editVM: PetViewModel
    @State private var showingSheet = false
    var onDismiss: () -> Void
    
    var body: some View {
        VStack {
            Button("Editar") {
                showingSheet = true
            }
            .foregroundColor(Color("cancel"))
            .background(Color("background"))
            .bold()
        }
        .sheet(isPresented: $showingSheet, onDismiss: onDismiss) {
            VStack(spacing: -22) {
                Rectangle()
                    .padding(.top, -40)
                    .frame(height: 25)
                    .foregroundColor(Color("editPetPicker"))
                    .background(.clear)
                    .overlay(
                        HStack(spacing: 85) {
                            Button("Cancelar") {
                                showingSheet = false
                            }
                            .foregroundColor(Color("cancel"))
                            Text("Editar Pet")
                                .bold()
                            Button("Salvar") {
                                editVM.save()
                                showingSheet = false
                                editVM.fetchPets()
                            }
                            .foregroundColor(Color("cancel"))
                            .bold()
                        }
                            .padding(.top, -25))
                    .frame(height: 100)
                Rectangle()
                    .frame(width: 400, height: 0.5)
                    .foregroundColor(.gray)
                    .padding(.top, -23)
                EditPetView()
                    .environmentObject(editVM)
            }
        }
        .background(Color("editPetPicker"))
    }
}

//struct EditPetSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPetSheet(
//    }
//}
