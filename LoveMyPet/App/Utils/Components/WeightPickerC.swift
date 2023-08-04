//
//  008-WeightPicker2.swift
//  LoveMyPet
//
//  Created by userext on 03/08/23.
//

import SwiftUI

let castratedOptions = [
    Options(name: "Não"),
    Options(name: "Sim")]

struct WeightPickerC: View {
    @State private var castratedop = castratedOptions[0]
    @State var kg: Int = 0
    @State var gram: Int = 0
    @State var isView: Bool = false
    var body: some View {
        VStack {
            List {
                PickerKG(isView: $isView)
                    .listRowBackground(Color("editPetPicker"))
                    .padding(.bottom, -30)
                Picker(selection: $castratedop, label: Text("Castrado(a)?")) {
                    ForEach(castratedOptions, id: \.name) { option in
                        Text(option.name).tag(option)
                    }
                }
                .pickerStyle(.automatic)
                .listRowBackground(Color("editPetPicker"))
            }
            .background(.clear)
            .scrollContentBackground(.hidden)
        }
    }
}

struct WeightPicker2_Previews: PreviewProvider {
    static var previews: some View {
        WeightPickerC()
    }
}
