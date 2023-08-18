//
//  PetView.swift
//  LoveMyPet
//
//  Created by userext on 09/08/23.
//

import SwiftUI

struct PetView: View {
    @Environment(\.managedObjectContext) var pet
//    @ObservedObject
    @State var showingSheet = false
    var body: some View {
        NavigationStack {
            VStack {
                Color("background")
                EmptyPetCard()
            }
            .padding(.bottom, 490)
            .navigationTitle("Pets")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement:
                        .navigationBarTrailing) {
                            AddPetSheet()
                        }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("background"))
        }
    }
}
struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView()
    }
}
