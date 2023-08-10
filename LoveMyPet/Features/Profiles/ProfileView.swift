//
//  ProfileView.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var themeViewModel: SettingsViewModel
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Color("background")
                }
            }
            //.preferredColorScheme(getPreferredAppTheme(for: themeViewModel.currentAppearence))
            .navigationTitle("Pets")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .navigationTitle("Pets")
    }
}
