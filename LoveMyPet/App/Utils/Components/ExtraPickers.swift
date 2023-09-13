//
//  008-WeightPicker2.swift
//  LoveMyPet
//
//  Created by userext on 03/08/23.
//

import SwiftUI

enum IsCastrated: String, Codable, CaseIterable {
    case yes = "Sim"
    case isNot = "Não"
    
    var description: Bool {
        switch self {
        case .yes:
            return true
        case .isNot:
            return false
        }
    }
}
let castratedOptions = [
    Options(name: "Não"),
    Options(name: "Sim")]

struct ExtraPickers: View {
    @ObservedObject var viewM: PetViewModel
    @State private var castratedop = castratedOptions[0]
    @State var kilo: Int = 0
    @State var gram: Int = 0
    @State var isView: Bool = false
    var body: some View {
        VStack {
            List {
                PickerKG(viewM: PetViewModel(stack: .shared), isView: $isView)
                    .listRowBackground(Color("editPetPicker"))
                    .padding(.bottom, -30)
                Picker(selection: $viewM.castrated, label: Text("Castrado(a)?")) {
                    ForEach(castratedOptions, id: \.name) { option in
                        Text(option.name).tag(option)
                    }
                }
                .pickerStyle(.automatic)
                .listRowBackground(Color("editPetPicker"))
            }
            .background(Color("background"))
            .scrollContentBackground(.hidden)
        }
    }
}

struct ExtraPickers_Previews: PreviewProvider {
    static var previews: some View {
        ExtraPickers(viewM: PetViewModel(stack: .shared))
    }
}
