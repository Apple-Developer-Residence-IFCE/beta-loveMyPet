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
    var body: some Scene {
        WindowGroup {
            ThemeView()
                .environmentObject(settingsViewModel)
                
        }
    }
}
