import SwiftUI
import PhotosUI

struct PetCard: View {
    @State var petName: String
    @State var petType: String
    @State var avatarImage: Data?

    var body: some View {
        HStack {
            if let data = avatarImage, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .cornerRadius(32)
            } else {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 64, height: 64)
            }

            VStack(alignment: .leading) {
                Text(petName)
                    .foregroundColor(Color("petCardText"))
                    .font(.custom("Poppins", size: 16))
                    .bold()
                    .padding(0.3)
                Text(petType)
                    .foregroundColor(Color("petCardText"))
                    .font(.custom("Poppins", size: 12))
            }
            Spacer()
            Image("Seta")
                .resizable()
                .frame(width: 30, height: 30)
        }
        .padding(.vertical, 17)
        .padding(.horizontal, 15)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 2)
                .foregroundColor(Color("petCardBorder"))
        )
        .background(Color("petCard"))
        .clipShape(RoundedRectangle(cornerRadius: 13))
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

struct PetCard_Previews: PreviewProvider {
    static var previews: some View {
        PetCard(petName: "Bidu", petType: "Cachorro", avatarImage: Data())
    }
}
