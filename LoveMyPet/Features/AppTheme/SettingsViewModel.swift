import Foundation
import SwiftUI

enum Appearence: Int, CaseIterable {
    case system
    case light
    case dark
}

class SettingsViewModel: ObservableObject {
    @AppStorage("appAppearence") var currentAppearence: Appearence = .system
    func setAppearence(_ appearence: Appearence) {
        currentAppearence = appearence
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

