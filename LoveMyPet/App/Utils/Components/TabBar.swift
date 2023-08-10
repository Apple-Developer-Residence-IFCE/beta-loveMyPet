//
//  TabBar.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI
struct TabBar<Theme: View, Profiles: View>: View {
    @Binding  var selectedTab: Tab
    @ViewBuilder let themeView: () -> Theme
    @ViewBuilder let profileView: () -> Profiles
    var body: some View {
        TabView(selection: $selectedTab) {
            PetView()
                .tabItem {
                    Label {
                        Text(Tab.pets.rawValue)
                            .foregroundColor(.white)
                    } icon: {
                        Image(selectedTab == .pets ? "selectedpetsIcon" :"PetsIcon")
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color("tabBar"), for: .tabBar)
                .tag(Tab.pets)
            ThemeView()
                .tabItem {
                    Label {
                        Text(Tab.settings.rawValue)
                            .foregroundColor(.white)
                    } icon: {
                        Image(selectedTab == .settings ? "selectedSettingsIcon" : "SettingsIcon")
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color("tabBar"), for: .tabBar)
                .tag(Tab.settings)
        }
        .accentColor(Color("principal"))
    }
}
enum Tab: String {
    case pets = "Pets"
    case settings = "Configurações"
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.pets),
               themeView: {
            ThemeView()
        },
               profileView: {
            PetView()
        })
        .environmentObject(SettingsViewModel())
    }
}
