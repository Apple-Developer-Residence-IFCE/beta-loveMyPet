//
//  SwiftUIView.swift
//  LoveMyPet
//
//  Created by userext on 19/07/23.
//

import SwiftUI

struct PickerKG: View {
    @Binding var quilo: Int
    @Binding var grama: Int
    @Binding var isView: Bool
    let numbers = Array(0...100)
    var body: some View {
        VStack {
            HStack {
                Text("Peso")
                    .padding(.horizontal, -15)
                Spacer()
                Rectangle()
                    .overlay {
                        HStack {
                            Text("\(quilo),\(grama) kg ")
                                .foregroundColor(Color("bottons"))
                        }
                    }
                    .frame(width: 70, height: 32)
                    .foregroundColor(.gray.opacity(0.10))
                    .cornerRadius(4)
                    .padding(.horizontal, -15)
            }
            .padding(.top, -20)
            .onTapGesture {isView.toggle()}
            .padding()
            HStack(spacing: 0) {
                if isView {
                    Group {
                        Picker("Quilo", selection: $quilo) {
                            ForEach(0..<100) {
                                Text("\($0)")
                            }
                        }
                        .frame(width: 50)
                        Picker("Gramas", selection: $grama) {
                            ForEach(0..<10) {
                                Text("\($0)")
                            }
                        }
                        .frame(width: 50)
                        .overlay {
                            Text("Kg")
                                .offset(x: 50)
                        }
                    }
                    .labelsHidden()
                    .fixedSize(horizontal: true, vertical: true)
                    .clipped()
                    .pickerStyle(WheelPickerStyle())
                }
            }
            .padding(.top, -85)
            .overlay {
                if isView {
                    Text(",")
                        .padding(.top, -50)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PickerKG( quilo: .constant(0), grama: .constant(0), isView: .constant(true))
    }
}
//        .onChange(of: quilo) { _ in
//            viewM.setWeight(kgramas: quilo, gramas: grama)
//        }
//        .onChange(of: grama) { _ in
//            viewM.setWeight(kgramas: quilo, gramas: grama)
//        }
