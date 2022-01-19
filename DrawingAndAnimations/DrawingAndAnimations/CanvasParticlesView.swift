//
//  CanvasParticlesView.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 19/01/2022.
//

import SwiftUI

struct CanvasParticlesView: View {
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let now = timeline.date.timeIntervalSinceReferenceDate
                let angle = Angle.degrees(now.remainder(dividingBy: 3) * 120)
                let x = cos(angle.radians)
                var image = context.resolve(Image(systemName: "sparkle"))
                image.shading = .color(.blue)
                let imageSize = image.size

                
                context.blendMode = .screen
                for position in 0..<10 {
                    
                    let frame = CGRect(
                        x: 0.5 * size.width + Double(position) * imageSize.width * x,
                        y: 0.5 * size.height,
                        width: imageSize.width,
                        height: imageSize.height
                    )
                    var innerContext = context
                    innerContext.opacity = 0.5
                    innerContext.fill(Ellipse().path(in: frame), with: .color(.cyan))
                    context.draw(image, in: frame)
                }
            }
        }
    }
}

struct CanvasParticlesView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasParticlesView()
            .preferredColorScheme(.dark)
    }
}
