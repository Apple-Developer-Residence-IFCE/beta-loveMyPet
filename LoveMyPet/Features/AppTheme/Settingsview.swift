import SwiftUI
struct ThemeView: View {
    @EnvironmentObject private var themeViewModel: SettingsViewModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Color("background")
                    .ignoresSafeArea()

                Text("APARÊNCIA")
                    .bold()
                    .font(.system(size: 15))
                    .padding(.bottom, 50)
                HStack(spacing: 30) {
                    ThemeButton(buttonId: 0,
                                selectedButton: $themeViewModel.selectedButton,
                                image: "system",
                                title: "Sistema") {
                        themeViewModel.setAppearence(.system)
                    }
                    ThemeButton(buttonId: 1,
                                selectedButton: $themeViewModel.selectedButton,
                                image: "light",
                                title: "Claro") {
                        themeViewModel.setAppearence(.light)
                    }
                    ThemeButton(buttonId: 2,
                                selectedButton: $themeViewModel.selectedButton,
                                image: "dark",
                                title: "Escuro") {
                        themeViewModel.setAppearence(.dark)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 350)
            }
            .padding(.horizontal, 16)
            .background(Color("background"))
            .preferredColorScheme(getPreferredAppTheme(for: themeViewModel.currentAppearence))
            .navigationTitle("Configurações")
        }
    }
    struct ThemeView_Previews: PreviewProvider {
        static var previews: some View {
            ThemeView()
                .environmentObject(SettingsViewModel())
        }
    }
}
