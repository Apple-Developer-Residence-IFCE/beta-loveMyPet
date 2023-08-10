import SwiftUI

struct ThemeButton: View {
    var buttonId: Int
    @EnvironmentObject private var appearenceviewmodel: SettingsViewModel
    @Binding var selectedButton: Int
    var image: String
    var title: String
    let action: () -> Void
    var body: some View {
        VStack {
            Image(image)
            Text(title)
            Button {
                appearenceviewmodel.currentAppearence = Appearence(rawValue: buttonId) ?? .system
                action()
            } label: {
                if appearenceviewmodel.currentAppearence.rawValue == buttonId {
                    Image("Vector")
                } else {
                    Circle()
                        .stroke(Color("principal"), lineWidth: 2)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.clear)
                }
            }
        }
    }
}
