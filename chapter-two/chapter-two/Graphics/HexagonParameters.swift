//
//  HexagonParameters.swift
//  chapter-two
//
//  Created by Samuel Owino on 29/11/2021.
//

import Foundation
import CoreGraphics

/**
 Create six segments each for every side of the hexagon
 */

struct HexagonParameters {
    
    static let adjustement: CGFloat = 0.085
    
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    static let segments = [
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20),
            curve:   CGPoint(x: 0.00, y: 0.30),
            control: CGPoint(x: 0.00, y: 0.25)
        ),
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70),
            curve:   CGPoint(x: 0.05, y: 0.80),
            control: CGPoint(x: 0.00, y: 0.75)
        ),
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80),
            curve:   CGPoint(x: 1.00, y: 0.70),
            control: CGPoint(x: 1.00, y: 0.75)
        ),
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30),
            curve:   CGPoint(x: 0.95, y: 0.20),
            control: CGPoint(x: 1.00, y: 0.25)
        )
    ]
}
