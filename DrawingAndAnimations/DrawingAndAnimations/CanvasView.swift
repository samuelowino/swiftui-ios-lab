//
//  CanvasView.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 19/01/2022.
//

import SwiftUI

struct CanvasView: View {
    var body: some View {
        Canvas { context, size in
            context.stroke(
                Path(ellipseIn: CGRect(origin: .zero, size: size)),
                with: .color(.green),
                lineWidth: 10
            )
        }
        .frame(width: 300, height: 200, alignment: .center)
        .border(.blue)
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
