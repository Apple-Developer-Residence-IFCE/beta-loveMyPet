//
//  002 - PetCard.swift
//  LoveMyPet
//
//  Created by userext on 24/07/23.
//

import SwiftUI
import PhotosUI

struct PetCard: View {
    
    @State var petName = "Robson"
    @State var petType = "Caramelo"
    @State private var avatarImage: Image?
    
    var body: some View {
        HStack {
            
            if let avatarImage {
                avatarImage
                    .frame(width: 70, height: 70)
                    .cornerRadius(40)
            } else {
                Image("ImagePicker")
            }
            
            VStack(alignment: .leading) {
                Text(petName)
                    .font(.title3)
                    .bold()
                    .padding(0.3)
                Text(petType)
            }
            Spacer()
            Image("Seta")
        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 13)
                .stroke(lineWidth: 2)
                .foregroundColor(.cinza)
        )
        .padding(25)
    }
}

extension Color {
    static let cinza = Color("editPetPickerBorder")
}

struct PetCard_Previews: PreviewProvider {
    static var previews: some View {
        PetCard()
    }
}
