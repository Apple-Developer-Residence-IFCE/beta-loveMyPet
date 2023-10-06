import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var themeViewModel: SettingsViewModel
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Color("background")
                }
            }
            .navigationTitle("Pets")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .navigationTitle("Pets")
    }
}
