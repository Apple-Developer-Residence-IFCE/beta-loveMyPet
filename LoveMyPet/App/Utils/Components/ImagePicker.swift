import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @State private var avatarItem: PhotosPickerItem?
    @State var avatarImage: Image?
    var body: some View {
        VStack {
            PhotosPicker(selection: $avatarItem, matching: .images) {
                VStack {
                    if let avatarImage {
                        avatarImage
                            .resizable()
                            .frame(width: 64, height: 64)
                            .scaledToFit()
                            .cornerRadius(32)
                        Text("Trocar foto")
                            .foregroundColor(Color("bottons"))
                            .font(.custom("Poppins", size: 13))
                    } else {
                        Circle()
                            .frame(width: 64, height: 64)
                            .foregroundColor(.gray)
                        Text("Escolher foto")
                            .foregroundColor(Color("bottons"))
                            .font(.custom("Poppins", size: 13))
                    }
                }
            }
        }
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    avatarImage = Image(uiImage: uiImage)
                } else {
                    print("Failed")
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
