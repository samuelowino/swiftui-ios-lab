//
//  ViewExtensions.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 01/12/2021.
//

import Foundation
import SwiftUI

extension View {
    func parkBrand(_ parkBrand: Color) -> some View {
        environment(\.parkBrand, parkBrand)
    }
}
