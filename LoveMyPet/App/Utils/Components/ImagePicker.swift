import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @State private var avatarItem: [PhotosPickerItem] = []
    @Binding var avatarImage: Data?
    var body: some View {
        PhotosPicker(selection: $avatarItem, maxSelectionCount: 1, matching: .images) {
            VStack {
                if let data = avatarImage, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                    
                    Text("Trocar foto")
                        .foregroundColor(Color("text"))
                } else {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 64, height: 64)
                    
                    Text("Escolher foto")
                        .foregroundColor(Color("text"))
                }
            }
            .foregroundColor(Color("PhotoPickerColor"))
        }
        .onChange(of: avatarItem) { _ in
            guard let items = avatarItem.first else { return }
            
            items.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data = data {
                        DispatchQueue.main.async {
                            self.avatarImage = data
                        }
                    } else {
                        print("No Data")
                    }
                case .failure(let error):
                    print("\(error)")
                }
            }
        }
    }
}


struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker(avatarImage: .constant(UIImage(named: "StupidCat")?.jpegData(compressionQuality: 1.0)))
    }
}
