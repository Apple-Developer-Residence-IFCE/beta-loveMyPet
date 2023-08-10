import SwiftUI

enum Appearence: Int, CaseIterable {
    case system = 0
    case light = 1
    case dark = 2
}

class SettingsViewModel: ObservableObject {
    @AppStorage("appAppearence") var currentAppearence: Appearence = .system
    @Published var selectedButton: Int = 0
    func setAppearence(_ appearence: Appearence) {
        currentAppearence = appearence
        selectedButton = appearence.rawValue
    }
}

func getPreferredAppTheme(for appearence: Appearence) -> ColorScheme {
    switch appearence {
    case .system:
        return .light
    case .light:
        return .light
    case .dark:
        return .dark
    }
}
