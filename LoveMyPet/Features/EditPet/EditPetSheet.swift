import SwiftUI

struct EditPetSheet: View {
    @State private var showingSheet = false
    var body: some View {
        VStack {
            Button("Mostrar Sheet") {
                showingSheet = true
            }
        }
        .sheet(isPresented: $showingSheet) {
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
                EditPetView()
            }
        }
        .background(Color("editPetPicker"))
    }
}

struct EditPetSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditPetSheet()
    }
}
