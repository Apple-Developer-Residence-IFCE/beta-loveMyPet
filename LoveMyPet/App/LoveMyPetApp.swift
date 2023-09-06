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
            TabBar(selectedTab: $selectedTab) {
                ThemeView()
            } profileView: {
                PetView(viewM: PetViewModel(stack: .shared))
            }
            .environmentObject(settingsViewModel)
            .preferredColorScheme(getPreferredAppTheme(for: settingsViewModel.currentAppearence))
        }
    }
}
