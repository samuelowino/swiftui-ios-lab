//
//  BadgeBackground.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 06/01/2022.
//

import SwiftUI


struct BadgeBackground: View {
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        //The addLine(to:) method takes a single point and draws it.
        //Successive calls to addLine(to:) begin a line at the previous point
        //and continue to the new point.
        GeometryReader { geometry in
            Path { outline in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height: CGFloat = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width*=xScale
                outline.move(to:
                                CGPoint(x: width * 0.95 + xOffset,
                                        y: height * (0.20 + HexagonParameters.adjustment)
                                       )
                )
                
                HexagonParameters.segments.forEach { segment in
                    outline.addLine(to: CGPoint(
                        x: width * segment.line.x + xOffset,
                        y: height * segment.line.y
                    ))
                    
                    outline.addQuadCurve(to: CGPoint(
                        x: width * segment.curve.x + xOffset,
                        y: height * segment.curve.y
                    ),
                                         control: CGPoint(
                                            x: width * segment.control.x + xOffset,
                                            y: height * segment.control.y
                    ))

                }
                
            }
            .fill(.linearGradient(Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                                  startPoint: UnitPoint(x: 0.5, y: 0),
                                  endPoint: UnitPoint(x: 0.5, y: 0.6)))
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
