//
//   View+.swift
//  DotSwiftSoundVisualizer
//
//  Created by Samuel Owino on 08/01/2022.
//

import Foundation
import SwiftUI

extension View {
    func maskContent<T: View>(using: T) -> some View {
        using.mask(self)
    }
}
