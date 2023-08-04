//
//  ProfileView.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                }
            }
            .navigationTitle("Pets")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .navigationTitle("Pets")
    }
}
