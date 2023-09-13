//
//  Picker.swift
//  LoveMyPet
//
//  Created by userext on 31/08/23.
//

import SwiftUI

struct Pickers<Op>: View where Op: Hashable {
    var title: String
    @Binding var selectedValue: Op
    var options: [Op]
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color("text"))
            Spacer()
            Picker(title, selection: $selectedValue) {
                ForEach(options, id: \.self) { option in
                    buildOption(option)
                }
            }
            .labelsHidden()
            .tint(Color("text2"))
        }
    }
    @ViewBuilder
    func buildOption(_ option: Op) -> some View {
        if let boolValue = option as? Bool {
            if boolValue {
                Text("Sim").tag(true)
            } else {
                Text("Não").tag(false)
            }
        } else if let rawValue = (option as? (any RawRepresentable))?.rawValue as? String {
            Text(String(describing: rawValue))
        } else if let pet = option as? Pet {
            Text(pet.name!)
        } else {
            Text(String(describing: option))
        }
    }
}

struct PickerText: View {
    var textInput: String = "Nome do Pet"
    @Binding var petName: String
    var body: some View {
        TextField(textInput, text: $petName)
            .padding(.vertical, 4)
    }
}

struct Pickers_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Pickers(title: "Gênero", selectedValue: .constant(""), options: ["Nenhum", "Macho", "Fêmea"])
            Pickers(title: "Especie", selectedValue: .constant(""), options: ["Nenhum", "Macho", "Fêmea"])
            Pickers(title: "Gênero", selectedValue: .constant(""), options: ["Nenhum", "Macho", "Fêmea"])
            PickerText(textInput: "Teste123", petName: .constant(""))
        }
    }
}
