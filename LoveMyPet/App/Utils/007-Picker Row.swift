////
////  ContentView.swift
////  Interface
//
////  Created by userext on 04/07/23.
////
//
//import SwiftUI
//
//struct Options: Hashable {
//    let name: String
//}
//
//let genderOptions = [
//    Options(name: "Masculino"),
//    Options(name: "Feminino"),
//    Options(name: "Outro"),
//    Options(name: "Nenhum"),
//    Options(name: "Não escolhida")
//]
//
//let speciesOptions = [
//    Options(name: "Cachorro"),
//    Options(name: "Gato"),
//    Options(name: "Pássaro"),
//    Options(name: "Nenhum"),
//    Options(name: "Não escolhida")
//]
//
//let raceOptions = [
//    Options(name: "Labrador"),
//    Options(name: "Persa"),
//    Options(name: "Canário"),
//    Options(name: "Nenhum"),
//    Options(name: "Não escolhida")
//]
//
//struct PickerView: View {
//    @State private var selectedGender = genderOptions[0]
//    @State private var selectedSpecies = speciesOptions[0]
//    @State private var selectedRace = raceOptions[0]
//
//    var body: some View {
//        VStack {
//            List {
//                Picker(selection: $selectedGender, label: Text("Gênero")) {
//                    ForEach(genderOptions, id: \.name) { option in
//                        Text(option.name).tag(option)
//                    }
//                }
//                .pickerStyle(.automatic)
//                Picker(selection: $selectedSpecies, label: Text("Espécies")) {
//                    ForEach(speciesOptions, id: \.name) { option in
//                        Text(option.name).tag(option)
//                    }
//                }
//
//                .pickerStyle(.automatic)
//                Picker(selection: $selectedRace, label: Text("Raça")) {
//                    ForEach(raceOptions, id: \.name) { option in
//                        Text(option.name).tag(option)
//                    }
//                }
//                .pickerStyle(.automatic)
//            }
//        }}
//}
//
//struct Picker_Previews: PreviewProvider {
//    static var previews: some View {
//        PickerView()
//    }
//}
