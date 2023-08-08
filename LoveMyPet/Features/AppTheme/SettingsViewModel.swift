import Foundation
import SwiftUI

enum Appearence: Int, CaseIterable {
    case system = 0
    case light
    case dark
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
    case .system, .light:
        return .light
    case .dark:
        return .dark
    }
}
