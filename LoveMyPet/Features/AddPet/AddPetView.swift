//
//  SwiftUiTeste.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct AddPetView: View {
    @State private var showingSheet = false
    @State var isView: Bool
    var body: some View {
        VStack {
            Button("Mostrar Pop-up") {
                showingSheet = true
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
        }
        .background(Color.black)
        .sheet(isPresented: $showingSheet) {
            NavigationStack {
                VStack {
                    Rectangle()
                        .padding(.top, -40)
                        .frame(height: 25)
                        .foregroundColor(Color("editPetPicker"))
                        .overlay(
                            HStack(spacing: 60) {
                                Button("Cancelar") {
                                    showingSheet = false
                                }
                                .foregroundColor(Color("cancel"))
                                Text("Adicionar Pet")
                                Button("Adicionar") {
                                    showingSheet = false
                                }
                            }
                        .padding(.top, -15))
                        .frame(height: 100)
                    Rectangle()
                        .frame(width: 400, height: 0.5)
                        .foregroundColor(.gray)
                        .padding(.top, -47)
                    ImagePicker()
                        .padding(.top, -35)
                    PickerView()
                        .padding(.top, -10)
                    WeightPickerC()
                        .padding(.top, -60)
                }
                .background(Color.white)
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}
struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView(isView: true)
    }
}
