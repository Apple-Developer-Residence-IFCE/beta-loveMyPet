//
//  ContentView.swift
//  LoveMyPet
//
//  Created by userext on 06/07/23.
//

import SwiftUI

struct EmptyPetCard: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("EmptyPetCard")
                .resizable()
                .scaledToFit()
                .padding(20)
            Text("Você não possui nenhum pet cadastrado :(")
                .font(.title2)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
}

struct EmptyPetCard_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPetCard()
    }
}
