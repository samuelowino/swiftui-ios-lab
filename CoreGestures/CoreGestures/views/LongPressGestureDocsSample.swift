//
//  LongPressGestureDocsSample.swift
//  CoreGestures
//
//  Created by Samuel Owino on 04/01/2022.
//

import SwiftUI

struct LongPressGestureDocsSample: View {
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 4) //Long press duration is determined by the $minimumDuration attribute
            .updating($isDetectingLongPress) { currentState, gestureState, transaction in
            gestureState = currentState
            transaction.animation = Animation.easeIn(duration: 3.0)
        }
        .onEnded { finished in
            self.completedLongPress = finished
        }
    }
    
    var body: some View {
        Circle()
            .fill(self.isDetectingLongPress ? Color.red :
                    (self.completedLongPress ? Color.green : Color.blue))
            .frame(width: 100, height: 100)
            .gesture(longPress)
    }
}

struct LongPressGestureDocsSample_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureDocsSample()
    }
}
