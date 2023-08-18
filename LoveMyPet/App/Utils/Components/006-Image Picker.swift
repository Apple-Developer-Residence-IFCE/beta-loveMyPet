import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State var text = "Escolher foto"
    var body: some View {
        PhotosPicker(selection: $avatarItem, matching: .images) {
        ZStack {
            VStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 64, height: 64)
                    Text(text)
                    .foregroundColor(Color("bottons"))
                }
                avatarImage?
                    .resizable()
                    .frame(width: 64, height: 64)
                    .scaledToFit()
                    .cornerRadius(100)
                    .padding(.bottom, 30)
            }
        }
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await
                    avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        avatarImage = Image(uiImage: uiImage)
                        text = "Trocar Foto"
                        return
                    } else {
                        print("Failed")
                    }
                }
            }
        }
    }
}
struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker()
    }
}
