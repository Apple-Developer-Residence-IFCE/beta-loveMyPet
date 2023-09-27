////
////  ContentView.swift
////  Interface
//
////  Created by userext on 04/07/23.
////
//
//import SwiftUI
//
//enum OptionsA: String, CaseIterable {
//    case masculino = "Masculino"
//}
//
//struct Options: Hashable {
//    let name: String
//}
//
//let genderOptions = [
//    Options(name: "Nenhum"),
//    Options(name: "Macho"),
//    Options(name: "Fêmea"),
//    Options(name: "Assexuado")]
//
//let speciesOptions = [
//    Options(name: "Não escolhida"),
//    Options(name: "Cachorro"),
//    Options(name: "Gato"),
//    Options(name: "Pássaro"),
//    Options(name: "Coelho"),
//    Options(name: "Hamster"),
//    Options(name: "Tartaruga"),
//    Options(name: "Cavalo"),
//    Options(name: "Outros")]
//
//let raceOptions = [
//    Options(name: "Não escolhida"),
//    Options(name: "Labrador"),
//    Options(name: "Persa"),
//    Options(name: "Canário"),
//    Options(name: "Nenhum")]
//
//struct PickerView: View {
//    @State private var selectedName = ""
//    @State private var selectedGender = genderOptions[0]
//    @State private var selectedSpecies = speciesOptions[0]
//    @State private var selectedRace = raceOptions[0]
//    @State private var birthday = Date()
//    var body: some View {
//        VStack {
//            List {
//                TextField("Nome do pet", text: $selectedName)
//                    .listRowBackground(Color("editPetPicker"))
//                Picker(selection: $selectedGender, label: Text("Gênero")) {
//                    ForEach(genderOptions, id: \.name) { option in
//                        Text(option.name).tag(option)
//                    }
//                }
//                .pickerStyle(.automatic)
//                .listRowBackground(Color("editPetPicker"))
//                Picker(selection: $selectedSpecies, label: Text("Espécie")) {
//                    ForEach(speciesOptions, id: \.name) { option in
//                        Text(option.name).tag(option)
//                    }
//                }
//                .pickerStyle(.automatic)
//                .listRowBackground(Color("editPetPicker"))
//                Picker(selection: $selectedRace, label: Text("Raça")) {
//                    ForEach(raceOptions, id: \.name) { option in
//                        Text(option.name).tag(option)
//                    }
//                }
//                .pickerStyle(.navigationLink)
//                .listRowBackground(Color("editPetPicker"))
//                DatePicker("Nascimento", selection: $birthday, displayedComponents: .date)
//                    .environment(\.locale, Locale.init(identifier: "pt"))
//                    .listRowBackground(Color("editPetPicker"))
//            }
//            .background(.clear)
//            .scrollContentBackground(.hidden)
//        }
//    }
//}
//
//struct Picker_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            PickerView()
//        }
//    }
//}
