//
//  View+.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 25/05/2022.
//

import Foundation
import SwiftUI

extension View {
    func primaryTitleStyle() -> some View {
        modifier(PrimaryTitleStyle())
    }
    
    func primaryFontStyle() -> some View {
        modifier(PrimaryFontStyle())
    }
}
