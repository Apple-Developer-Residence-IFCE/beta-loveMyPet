import SwiftUI

struct PetSheet: View {
    @State var showingSheet = false
    var body: some View {
        VStack {
            Button("Adicionar") {
                showingSheet = true
            }
            .foregroundColor(Color("cancel"))
            .background(Color("background"))
            .bold()
        }
        .sheet(isPresented: $showingSheet) {
            VStack(spacing: -22) {
                Rectangle()
                    .padding(.top, -40)
                    .frame(height: 25)
                    .foregroundColor(Color("editPetPicker"))
                    .background(.clear)
                    .overlay(
                        HStack(spacing: 60) {
                            Button("Cancelar") {
                                showingSheet = false
                            }
                            .foregroundColor(Color("cancel"))
                            Text("Adicionar Pet")
                                .bold()
                            Button("Adicionar") {
                                showingSheet = false
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
                AddPetView(viewModel: PetViewModel(stack: .shared))
            }
        }
        .background(Color("editPetPicker"))
    }
}

struct PetSheet_Previews: PreviewProvider {
    static var previews: some View {
        PetSheet()
    }
}