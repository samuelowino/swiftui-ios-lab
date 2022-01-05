//
//  RotationGestureView.swift
//  CoreGestures
//
//  Created by Samuel Owino on 05/01/2022.
//

import SwiftUI

struct RotationGestureView: View {
    
    @State var angle: Angle = Angle(degrees: 0.0)
    
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.angle = angle
            }
    }
    
    var body: some View {
        Rectangle()
            .fill(.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .rotationEffect(self.angle)
            .gesture(rotationGesture)
    }
}

struct RotationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureView()
    }
}
