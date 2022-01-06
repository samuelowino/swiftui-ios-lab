//
//  BadgeBackground.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 06/01/2022.
//

import SwiftUI


struct BadgeBackground: View {
    var body: some View {
        //The addLine(to:) method takes a single point and draws it.
        //Successive calls to addLine(to:) begin a line at the previous point
        //and continue to the new point.
        GeometryReader { geometry in
            Path { outline in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height: CGFloat = width
                
                outline.move(to:CGPoint(x: width * 0.95, y: height * (0.20 + HexagonParameters.adjustment)))
                
                HexagonParameters.segments.forEach { segment in
                    outline.addLine(to: CGPoint(
                        x: width * segment.line.x,
                        y: height * segment.line.y
                    )
                    )
                    
                    outline.addQuadCurve(to: CGPoint(
                        x: width * segment.curve.x,
                        y: height * segment.curve.y
                    ),
                                         control: CGPoint(
                                            x: width * segment.control.x,
                                            y: height * segment.control.y
                    ))

                }
                
            }
            .fill(.black)
        }
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
