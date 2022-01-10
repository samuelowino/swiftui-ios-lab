//
//  Gauge.swift
//  DotSwiftSoundVisualizer
//
//  Created by Samuel Owino on 08/01/2022.
//

import SwiftUI

struct Gauge: View {
    
    var body: some View {
       Gauge()
            .maskContent(using:
                            AngularGradient(gradient: Gradient(colors: [.green, .blue]), center: .bottomLeading, angle: Angle(degrees: -90)))
    }
}

struct GaugeHolder: View {
    var circleThickness: CGFloat = 40
    var trim: ClosedRange<CGFloat> = 0...0.65
    
    var body: some View {
        Circle()
            .trim(from: trim.lowerBound, to: trim.upperBound)
            .stroke(style: StrokeStyle(lineWidth: circleThickness))
    }
}

struct Gauge_Previews: PreviewProvider {
    static var previews: some View {
        Gauge()
    }
}
