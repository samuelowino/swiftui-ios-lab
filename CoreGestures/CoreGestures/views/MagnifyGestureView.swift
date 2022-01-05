//
//  MagnifyGestureView.swift
//  CoreGestures
//
//  Created by Samuel Owino on 05/01/2022.
//

import SwiftUI

struct MagnifyGestureView: View {
    
    @GestureState private var magnifyBy = 1.0
    
    var magnifyGesture: some Gesture {
        MagnificationGesture()
            .updating($magnifyBy) { currentState, gestureState, transaction in
                gestureState = currentState
            }
    }
    
    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 100, height: 100, alignment: .center)
            .scaleEffect(magnifyBy)
            .gesture(magnifyGesture)
    }
}

struct MagnifyGestureView_Previews: PreviewProvider {
    static var previews: some View {
        MagnifyGestureView()
    }
}
