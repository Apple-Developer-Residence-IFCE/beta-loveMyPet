import SwiftUI
struct ThemeView: View {
    @EnvironmentObject private var themeViewModel: SettingsViewModel
    @State var selectedButton: Int = 0
    var body: some View {
        VStack {
            Color("background")
                .ignoresSafeArea()
            Text("Configurações")
                .bold()
                .font(.system(size: 30))
                .padding(.bottom, 50)
                .padding(.horizontal, -150)
            Text("APARÊNCIA")
                .bold()
                .font(.system(size: 15))
                .padding(.bottom, 50)
                .padding(.horizontal, -150)
            HStack(spacing: 30) {
                ThemeButton(buttonId: 0, selectedButton: $selectedButton, image: "system", title: "Sistema") {
                    themeViewModel.currentAppearence = .system
                }
                ThemeButton(buttonId: 1, selectedButton: $selectedButton, image: "light", title: "Claro") {
                    themeViewModel.currentAppearence = .light
                }
                ThemeButton(buttonId: 2, selectedButton: $selectedButton, image: "dark", title: "Escuro") {
                    themeViewModel.currentAppearence = .dark
                }
            }
            .padding(.bottom, 350)
        }
        .background(Color("background"))
        .preferredColorScheme(getPreferredAppTheme(for: themeViewModel.currentAppearence))
    }
    struct ThemeView_Previews: PreviewProvider {
        static var previews: some View {
            ThemeView()
        }
    }
}
