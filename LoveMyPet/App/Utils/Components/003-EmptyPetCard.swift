import SwiftUI

struct EmptyPetCard: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("EmptyPetCard")
                .padding(20)
            Text("Você não possui nenhum \n pet cadastrado :(")
                .font(.custom("Poppins", size: 18))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
}

struct EmptyPetCard_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPetCard()
    }
}
