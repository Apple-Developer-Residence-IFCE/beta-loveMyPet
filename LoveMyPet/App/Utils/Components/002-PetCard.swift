import SwiftUI
import PhotosUI

struct PetCard: View {

    @State var petName = "Robson"
    @State var petType = "Caramelo"
    @State private var avatarImage: Image?

    var body: some View {
        HStack {
            if let avatarImage {
                avatarImage
                    .frame(width: 64, height: 64)
                    .cornerRadius(32)
            } else {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 64, height: 64)
            }

            VStack(alignment: .leading) {
                Text(petName)
                    .font(.custom("Poppins", size: 16))
                    .bold()
                    .padding(0.3)
                Text(petType)
                    .font(.custom("Poppins", size: 12))
            }
            Spacer()
            Image("Seta")
        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 13)
                .stroke(lineWidth: 2)
                .foregroundColor(Color("editPetPickerBorder"))
        )
        .padding(25)
    }
}

struct PetCard_Previews: PreviewProvider {
    static var previews: some View {
        PetCard()
    }
}
