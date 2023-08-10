//
//  LoveMyPetApp.swift
//  LoveMyPet
//
//  Created by userext on 05/07/23.
//

import SwiftUI

@main
struct LoveMyPetApp: App {
    @StateObject private var settingsViewModel = SettingsViewModel()
    @State var selectedTab: Tab = .pets
    var body: some Scene {
        WindowGroup {
            AddPetView()
            TabBar(selectedTab: $selectedTab) {
                ThemeView()
            } profileView: {
                ProfileView()
            }
            .environmentObject(settingsViewModel)
            .preferredColorScheme(getPreferredAppTheme(for: settingsViewModel.currentAppearence))
        }
    }
}
