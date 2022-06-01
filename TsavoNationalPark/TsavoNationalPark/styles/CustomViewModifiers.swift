//
//  CustomViewModifiers.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 25/05/2022.
//

import Foundation
import SwiftUI


struct PrimaryTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 6)
            }
            .foregroundColor(.black)
    }
}

struct SecondaryTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 6)
            }
            .foregroundColor(.gray)
    }
}

struct PrimaryFontStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .light, design: .monospaced))
    }
}
