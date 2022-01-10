//
//  GadientViews.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 10/01/2022.
//

import SwiftUI

struct GradientViews: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Linear Gradient")
                RoundedRectangle(cornerRadius: 18)
                    .fill(
                        LinearGradient(colors: [.yellow, .orange, .black], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 200, height: 200, alignment: .center)
                
                Divider()
                                
                Text("Radial Gradient")
                RoundedRectangle(cornerRadius: 18)
                    .fill(
                        RadialGradient(colors: [.purple, .blue, .pink], center: .center, startRadius: 5, endRadius: 120)
                    )
                    .frame(width: 200, height: 200, alignment: .center)
                
                Divider()

                Text("Angular Gradient")
                RoundedRectangle(cornerRadius: 18)
                    .fill(
                        AngularGradient(colors: [.gray, .white,.black], center: .center, angle: Angle(degrees: 45))
                    )
                    .frame(width: 200, height: 200, alignment: .center)

                Divider()

                Spacer()
                
//                ZStack {
//                   Circle().fill(.green)
//                   Circle().fill(.yellow).scaleEffect(0.8)
//                   Circle().fill(.orange).scaleEffect(0.6)
//                   Circle().fill(.red).scaleEffect(0.4)
//                }

            }
        }
    }
}

struct GadientViews_Previews: PreviewProvider {
    static var previews: some View {
        GradientViews()
    }
}
