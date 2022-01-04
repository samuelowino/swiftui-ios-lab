//
//  DragGestureViewBasic.swift
//  CoreGestures
//
//  Created by Samuel Owino on 04/01/2022.
//

import SwiftUI

struct DragGestureViewBasic: View {
    
    @State var isDragging: Bool = false
    @State var viewLocation: CGPoint = CGPoint(x: 50, y: 50)
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 150000, coordinateSpace: .local)
            .onChanged { location in
                self.isDragging = true
                self.viewLocation = location.location
            }
            .onEnded { _ in self.isDragging = false }
    }
    
    var body: some View {
        Circle()
            .fill(isDragging ? .blue : .red)
            .frame(width: 100, height: 100, alignment: .center)
            .position(viewLocation)
            .gesture(dragGesture)
    }
}

struct DragGestureViewBasic_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureViewBasic()
    }
}
