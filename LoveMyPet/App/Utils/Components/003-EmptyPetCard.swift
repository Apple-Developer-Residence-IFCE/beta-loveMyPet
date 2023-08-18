import SwiftUI

struct EmptyPetCard: View {
    var body: some View {
        VStack {
            Image("EmptyPetCard")
                .padding(20)
                Text("Você não possui nenhum ")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .font(.custom("Poppins", size: 18))
                Text("pet cadastrado :(")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .font(.custom("Poppins", size: 18))
            }
            .background(Color("background"))
    }
}

struct EmptyPetCard_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPetCard()
    }
}
