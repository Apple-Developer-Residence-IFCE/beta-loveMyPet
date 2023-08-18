//
//  SwiftUiTeste.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct AddPetView: View {
    @StateObject var viewModel = PetViewModel(stack: CoreDataStack())
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Spacer(minLength: 25)
                ImagePicker()
                PickerView(selectedName: .constant(""), selectedGender: .constant(""),
                           selectedSpecies: .constant(""), selectedRace: .constant(""),
                           birthday: .constant(Date.now))
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
