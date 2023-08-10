//
//  SwiftUiTeste.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct AddPetView: View {
//    @ObservedObject var viewModel: PetViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Spacer(minLength: 25)
                ImagePicker()
                PickerView()
                    .padding(.top, -10)
                WeightPickerC()
                    .padding(.top, -53)
            }
            .background(Color("background"))
            .background(.clear)
        }
    }
}

struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView()
    }
}
