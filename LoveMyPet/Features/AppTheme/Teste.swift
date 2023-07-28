// import SwiftUI
//
// struct TheView: View {
//    enum DisplayMode: Int {
//        case system = 0
//        case dark = 1
//        case light = 2
//    }
//
//    @AppStorage("displayMode") var displayMode: DisplayMode = .system
//
//    func overrideDisplayMode() {
//        var userInterfaceStyle: UIUserInterfaceStyle
//
//        switch displayMode {
//        case .dark: userInterfaceStyle = .dark
//        case .light: userInterfaceStyle = .light
//        case .system: userInterfaceStyle = UITraitCollection.current.userInterfaceStyle
//        }
//
//        if let windowScene = UIWindowScene.windows.first?.windowScene {
//            for window in windowScene.windows {
//                window.overrideUserInterfaceStyle = userInterfaceStyle
//            }
//        }
//    }
//
//    var body: some View {
//        VStack {
//            Button(action: {
//                displayMode = .system
//                overrideDisplayMode()
//            }) {
//                Text("System")
//            }
//
//            Button(action: {
//                displayMode = .light
//                overrideDisplayMode()
//            }) {
//                Text("Light")
//            }
//
//            Button(action: {
//                displayMode = .dark
//                overrideDisplayMode()
//            }) {
//                Text("Dark")
//            }
//        }.onAppear(perform: overrideDisplayMode)
//    }
// }
