//
//  SwiftUiTeste.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct AddPetView: View {
    @State private var showingSheet = false
    @State var isView: Bool = false
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
