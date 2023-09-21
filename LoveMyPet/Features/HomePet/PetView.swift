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
        NavigationView {
            VStack {
                if viewM.savedPets.isEmpty {
                    EmptyPetCard()
                        .padding(.bottom, 490)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(viewM.savedPets, id: \.id) { pet in
                            PetCard(petName: pet.name ?? "", petType: pet.race ?? "" )
                                .padding(.horizontal, 15)
                        }
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
                            PetSheet()
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
//                Color("background")
// .scrollContentBackground(.hidden)
//            .safeAreaInset(edge: .top, alignment: .trailing, spacing: nil) {
//                Text("")
//                    .frame(maxWidth: .infinity)
//                    .background(Color("background"))
//            }
