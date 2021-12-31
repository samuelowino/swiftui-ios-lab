//
//  IgnitionDriveView.swift
//  CoreGestures
//
//  Created by Samuel Owino on 31/12/2021.
//

import SwiftUI

struct IgnitionDriveView: View {
    
    @GestureState private var drivingGestureState = false
    @GestureState private var reverseGestureState = false
    @State private var showDriveAlert = true
    @State private var showOutOfGasAlert = false
    @State private var distanceCovered: Float = 1.0
    
    var body: some View {
        
        let circleShape = Circle()
        let driveGesture = LongPressGesture(minimumDuration: 1)
            .updating($drivingGestureState) { (currentState, gestureState, transaction) in
                if distanceCovered < 1000 {
                    distanceCovered += 1
                } else {
                    showOutOfGasAlert = true
                }
                gestureState = currentState
            }
        
        let reverseGesture = LongPressGesture(minimumDuration: 1)
            .updating($reverseGestureState) { (currentState, gestureState, transaction) in
                gestureState = currentState
                if distanceCovered > 0 {
                    distanceCovered -= 1
                }
            }
        
        VStack(alignment: .leading) {
            Text("Distance Covered in Km: \(distanceCovered)")
                .font(.headline)
            ProgressView(value: distanceCovered)
                .frame(height: 40)
            
            HStack {
                ZStack {
                    circleShape.strokeBorder(style: StrokeStyle(lineWidth: 2))

                    circleShape
                        .fill(.white)
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    Text("D")
                        .bold()
                        .padding()
                        .foregroundColor(.green)
                        .font(.title)
                }.foregroundColor(.green)
                    .gesture(driveGesture)
                
                Spacer()
                
                ZStack {
                    circleShape.strokeBorder(style: StrokeStyle(lineWidth: 2))

                    circleShape
                        .fill(.white)
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    Text("R")
                        .bold()
                        .padding()
                        .foregroundColor(.red)
                        .font(.title)
                }.foregroundColor(.green)
                    .gesture(reverseGesture)
                    
            }.padding()
        }.alert("Press D to Drive and R to Reverse", isPresented: $showDriveAlert) {
            Button("Okay") { showDriveAlert = false }
        }.alert("You ran out of Gas, Reverse to Gas Station", isPresented: $showOutOfGasAlert) {
            Button("Sucks, but fine!") { showOutOfGasAlert = false }
        }
        .padding()
    }
}

struct IgnitionDriveView_Previews: PreviewProvider {
    static var previews: some View {
        IgnitionDriveView()
    }
}
