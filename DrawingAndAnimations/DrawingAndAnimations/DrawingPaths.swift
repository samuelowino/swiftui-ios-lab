//
//  DrawingPaths.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 14/01/2022.
//

import SwiftUI

struct DrawingPaths: View {
    var body: some View {
        VStack {
            
            //==================
            // addLine()
            //==================
            Text("Path Line")
            Path { path in
                path.move(to: CGPoint(x: 30, y: 10))
                path.addLine(to: CGPoint(x: 30, y: 30))
                path.addLine(to: CGPoint(x: 300, y: 30))
                path.addLine(to: CGPoint(x: 300, y: 10))
            }.fill(.linearGradient(colors: [.red, .orange, .green], startPoint: .top, endPoint: .bottom))
            
            Spacer()
            
            //====================
            //addArch()
            //===================
            Text("Path Arch 110 Degrees")
                .foregroundColor(.green)
            Spacer()
            
            Path { path in
                path.move(to: CGPoint(x: 100, y: 0))
                path.addArc(center: CGPoint(x: 100, y: 0), radius: 100.0, startAngle: Angle(degrees: 110), endAngle: Angle(degrees: 0), clockwise: true)
            }.fill(.angularGradient(colors: [.red,.green,.blue,.orange,.pink], center: .topLeading, startAngle: Angle(degrees:0), endAngle: Angle(degrees: 90)))
                .frame(width: 300, height: 300)
        }
       
    }
}

struct DrawingPaths_Previews: PreviewProvider {
    static var previews: some View {
        DrawingPaths()
    }
}
