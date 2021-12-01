//
//  ParkBrandEnvironmentKey.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 01/12/2021.
//

import Foundation
import SwiftUI

private struct ParkBrandEnvironmentKey: EnvironmentKey {
    static let defaultValue: Color = Color.green
}

extension EnvironmentValues {
    var parkBrand: Color {
        get { self[ParkBrandEnvironmentKey.self]}
        set { self[ParkBrandEnvironmentKey.self] = newValue }
    }
}

