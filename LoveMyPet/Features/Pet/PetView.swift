//
//  PetView.swift
//  LoveMyPet
//
//  Created by userext on 09/08/23.
//

import SwiftUI

struct PetView: View {
    @StateObject var viewM: PetViewModel
//    @State var showingSheet = false
    var body: some View {
        NavigationStack {
            VStack {
                Color("background")
                if viewM.savedPets.isEmpty {
                    EmptyPetCard()
                } else {
                    List {
//                        ForEach(viewM.savedPets, id: \.self) { pet in
//                            VStack { PetCard(
//                                }
//                        }
                    }
                }
            }
            .padding(.bottom, 490)
            .navigationTitle("Pets")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement:
                        .navigationBarTrailing) {
                            PetSheet()
                        }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("background"))
        }
    }
}
struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView(viewM: PetViewModel(stack: .shared))
    }
}
