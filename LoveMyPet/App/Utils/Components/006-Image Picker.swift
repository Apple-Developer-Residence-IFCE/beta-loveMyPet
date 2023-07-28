//
//  006-Image Picker.swift
//  LoveMyPet
//
//  Created by userext on 20/07/23.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    var body: some View {
        VStack {
            PhotosPicker(selection: $avatarItem, matching: .images) {
                VStack {
                    if let avatarImage {
                        avatarImage
                            .resizable()
                            .frame(width: 70, height: 70)
                            .scaledToFit()
                            .cornerRadius(100)
                        Text("Trocar foto")
                            .foregroundColor(.black)
                    } else { Image("ImagePicker")
                            .frame(width: 70, height: 70)
                        Text("Escolher foto")
                            .foregroundColor(.black)
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
