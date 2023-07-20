import SwiftUI

struct ThemeView: View {
    @State var selectedButton: Int = 0
    var body: some View {
        VStack {
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
                ModeView(buttonId: 0, selectedButton: $selectedButton, image: "system", title: "Sistema")
                ModeView(buttonId: 1, selectedButton: $selectedButton, image: "light", title: "Claro")
                ModeView(buttonId: 2, selectedButton: $selectedButton, image: "dark", title: "escuro")
                }
            }
            .padding(.bottom, 200)
        }
    }

struct ModeView: View {
    var buttonId: Int
    @Binding var selectedButton: Int
    var image: String
    var title: String
    var body: some View {
        VStack {
            Image(image)
            Text(title)
                Button {
                    selectedButton = buttonId
                } label: {
                    if !(selectedButton == buttonId) {
                    Circle()
                        .stroke(Color("principal"), lineWidth: 2)
                        .frame(width: 20, height: 20)
                        .foregroundColor(selectedButton == 2 ? Color("principal") : .clear)
                } else {
                        Image("Vector")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
