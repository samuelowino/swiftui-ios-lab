//
//  BadgeView.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 10/01/2022.
//

import SwiftUI

struct BadgeView: View {
    
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(angle: .degrees((Double(index) / 8.0)) * 360 )
        }
        .opacity(0.5)

    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }

        }.scaledToFit()
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
