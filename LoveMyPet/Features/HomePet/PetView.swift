//
//  PetView.swift
//  LoveMyPet
//
//  Created by userext on 09/08/23.
//

import SwiftUI

struct PetView: View {
    @StateObject var viewM = PetViewModel(stack: CoreDataStack.shared)
    var body: some View {
        NavigationStack {
            VStack {
                if viewM.savedPets.isEmpty {
                    EmptyPetCard()
                        .padding(.bottom, 490)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(viewM.savedPets) { pet in
                            NavigationLink {
                                PetDetails()
                                    .environmentObject(viewM)
                                    .onAppear {
                                        viewM.selectedPet(pet)
                                    }
                            } label: {
                                PetCard(petName: pet.name ?? "", petType: pet.race ?? "", avatarImage: pet.image)
                                    .padding(.horizontal, 15)
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.vertical, 30)
                        .listRowBackground(Color("background"))
                    }
                }
            }
            .onAppear {
                viewM.fetchPets()
                viewM.pickerClear()
            }
            .navigationTitle("Pets")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    AddPetView()
                        .environmentObject(viewM)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color("background"))
        }
    }
}
struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView()
    }
}
