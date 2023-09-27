//
//  SwiftUiTeste.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct EditPetView: View {
    @EnvironmentObject var viewModel: PetViewModel
    @State private var showingSheet = false
    @State var isView: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer(minLength: 25)
                ImagePicker()
                //PickerView()
                    .padding(.top, -15)
                ExtraPickers(viewM: viewModel)
                Button(action: {
                    viewModel.delete()
                    print("Cadastro excluído!")
                }
                ) {
                    Text("Excluir cadastro")
                        .foregroundColor(.white)
                        .frame(width: 327, height: 48)
                        .background(Color("delete"))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                }
            }
            .background(Color("background"))
            .background(.clear)
        }
    }
}
struct EditPetView_Previews: PreviewProvider {
    static var previews: some View {
        EditPetView()
    }
}
