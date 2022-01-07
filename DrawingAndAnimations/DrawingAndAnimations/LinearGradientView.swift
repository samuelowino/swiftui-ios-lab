//
//  LinearGradientView.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 07/01/2022.
//

import SwiftUI

struct LinearGradientView: View {
    
    @State private var colors: [Color] = [.orange, .pink, .purple,.blue, .green, .yellow, .red]
    
    var body: some View {
        
        let gradient = Gradient(colors: colors)
        let linearGradient = LinearGradient(gradient: gradient, startPoint: UnitPoint.top, endPoint: UnitPoint.bottom)
        
        return Rectangle()
            .fill(linearGradient)
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct LinearGradientView_Previews: PreviewProvider {
    static var previews: some View {
        LinearGradientView()
    }
}
