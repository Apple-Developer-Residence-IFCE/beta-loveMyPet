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
    var description: String {
        switch self {
        case .yes:
            return "Sim"
        case .isNot:
            return "Não"
        }
    }
}

struct ExtraPickers: View {
    @EnvironmentObject var viewModel: PetViewModel
//    @ObservedObject var viewM: PetViewModel
    @State var isView: Bool = false
    var body: some View {
        VStack {
            List {
                PickerKG(quilo: $viewModel.quilos, grama: $viewModel.grama, isView: $isView)
                    .listRowBackground(Color("editPetPicker"))
                    .padding(.bottom, -30)
                Picker(selection: $viewModel.castrated, label: Text("Castrado(a)?")) {
                    ForEach(IsCastrated.allCases, id: \.self) { castratedCase in
                        Text(castratedCase.rawValue).tag(castratedCase)
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
        ExtraPickers()
            .environmentObject(PetViewModel(stack: .shared))
    }
}
