
import SwiftUI

struct TabItemLove: View {
    var body: some View {
        HStack {
            Image("LoveMyPet")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                Spacer()
            Button(action: {
                // Ação do botão
                print("Botão pressionado")
            }) {
                Image("Calendar")
                    .resizable()
                    .frame(width: 40, height: 40)
                    
            }
            Button(action: {
                // Ação do botão
                print("Botão pressionado")
            }) {
                Image("Vector")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding()
            }
        }
        .padding(.leading, 35)
        .padding(.trailing, 10)
        
    }
}

struct TabItemLove_Previews: PreviewProvider {
    static var previews: some View {
        TabItemLove()
    }
}
