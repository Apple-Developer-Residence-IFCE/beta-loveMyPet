//
//  pickerview.swift
//  LoveMyPet
//
//  Created by userext on 18/07/23.
//

import SwiftUI

struct WeightPickerView: View {
    @State var kg: Int = 0
    @State var gram: Int = 0
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Peso")
                    Spacer()
                    Rectangle()
                        .overlay {
                            HStack {
                                Text("\(kg)")
                                    .foregroundColor(.black)
                                Text(",")
                                    .foregroundColor(.black)
                                Text("\(gram)kg")
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(width: 100, height: 32)
                        .foregroundColor(.gray.opacity(0.10))
                        .cornerRadius(4)
                }.padding()
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                HStack(spacing: 0) {
                    Group {
                        Picker("kilogram", selection: $kg) {
                            ForEach(0..<1000) {
                                Text("\($0)")
                            }
                        }
                        Picker("gram", selection: $gram) {
                            ForEach(0..<200) {
                                Text("\($0%10)").tag($0 % 10)
                            }
                        }
                        .overlay {
                            Text("kg")
                                .offset(x: 50)
                        }
                    }
                    .frame(width: geometry.size.width / 2 + 30)
                    .labelsHidden()
                    .fixedSize(horizontal: true, vertical: true)
                    .frame(width: geometry.size.width / 2, height: 160)
                    .clipped()
                    .pickerStyle(.wheel)
                }
                .overlay(Text(","))
            }
        }
        .frame(height: 160)
    }
}
struct WeightPickerView_Previews: PreviewProvider {
    static var previews: some View {
        WeightPickerView()
    }
}
