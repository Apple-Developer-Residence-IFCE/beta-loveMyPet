import Foundation
import SwiftUI

enum AppTheme: Int {
    static var id: String = "Appearence"

    case system = 0
    case light
    case dark
}

class SettingsViewModel: ObservableObject {
    static var shared: SettingsViewModel = SettingsViewModel()

    @AppStorage(AppTheme.id) private var theme: Int = 0

    func setTheme(_ theme: AppTheme) {
        self.theme = theme.rawValue
    }

    func getTheme() -> AppTheme {
        guard let currentAppearence = AppTheme(rawValue: theme)
        else {
            return AppTheme.system
        }

        return currentAppearence
    }

}
