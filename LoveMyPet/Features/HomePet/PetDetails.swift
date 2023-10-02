//
//  PetDetails.swift
//  LoveMyPet
//
//  Created by userext on 21/09/23.
//

import SwiftUI

struct PetDetails: View {
    @Environment (\.presentationMode) var presetationMode
    @EnvironmentObject var petDetailViewM: PetViewModel
    var body: some View {
        VStack {
            Color("background")
            if let data = petDetailViewM.image, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: .infinity)
                    .frame(height: 194)
                    .clipped()
            }
            VStack {
                HStack {
                    Text("Informações")
                        .font(.custom("Poppins-Bold", size: 20))
                    Spacer()
                    if petDetailViewM.gender.rawValue == "Macho" {
                        Image("MaleIcon")
                    } else {
                        Image("FemaleIcon")
                    }
                }.padding(.horizontal)
                HStack {
                    Text("Nome")
                        .font(.custom("Poppins-Bold", size: 16))
                    Spacer()
                    Text("\(petDetailViewM.name)")
                }.padding(.horizontal)
                    .padding(.vertical, 4)
                HStack {
                    Text("Espécie")
                        .font(.custom("Poppins-Bold", size: 16))
                    Spacer()
                    Text("\(petDetailViewM.species.description)")
                }.padding(.horizontal)
                    .padding(.vertical, 4)
                HStack {
                    Text("Nascimento")
                        .font(.custom("Poppins-Bold", size: 16))
                    Spacer()
                    Text(petDetailViewM.formatDate(petDetailViewM.age))
                }.padding(.horizontal)
                    .padding(.vertical, 4)
                HStack {
                    Text("Raça")
                        .font(.custom("Poppins-Bold", size: 16))
                    Spacer()
                    Text("\(petDetailViewM.race.description)")
                }.padding(.horizontal)
                    .padding(.vertical, 4)
                HStack {
                    Text("Peso")
                        .font(.custom("Poppins-Bold", size: 16))
                    Spacer()
                    Text(String(format: "%.1f kg", petDetailViewM.weight))
                        .font(.custom("Poppins-Regular", size: 16))
                }.padding(.horizontal)
                    .padding(.vertical, 5)
                Rectangle()
                    .foregroundColor(Color("tabBarLine"))
                    .frame(width: 330, height: 3)
                HStack {
                    Text("Adicionais")
                        .font(.custom("Poppins-Bold", size: 20))
                    Spacer()
                }.padding(.horizontal)
                    .padding(.vertical, 5)
                HStack {
                    Text("Castrado(a)?")
                        .font(.custom("Poppins-Bold", size: 16))
                    Spacer()
                    Text("\(petDetailViewM.castrated.rawValue)")
                }.padding(.horizontal)
                
            }.padding(.horizontal)
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                EditPetSheet(onDismiss: {
                    presetationMode.wrappedValue.dismiss()
                })
                    .environmentObject(petDetailViewM)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("background"))
        .padding(.bottom, 125)
        .background(.clear)
        .environmentObject(petDetailViewM)
        .background(Color("background"))
        .navigationTitle("Informações do pet")
    }
    
}

struct PetDetails_Previews: PreviewProvider {
    static var previews: some View {
        PetDetails()
            .environmentObject(PetViewModel(stack: .shared)
            )
    }
}
