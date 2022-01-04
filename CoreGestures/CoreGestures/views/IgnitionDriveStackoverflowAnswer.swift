//
//  IgnitionDriveStackoverflowAnswer.swift
//  CoreGestures
//
//  Created by Samuel Owino on 04/01/2022.
//

import SwiftUI

struct IgnitionDriveStackoverflowAnswer: View {
    @State private var timer: Timer?
    @State var isLongPressD = false
    @State var isLongPressR = false
    @GestureState var driveGestureState = false
    
    @State private var showDriveAlert = true
    @State private var showOutOfGasAlert = false
    @State var distanceCovered: Float = 0.0

    private func circleShape(isPressed: Binding<Bool>) -> some View  {
        Button(action: {
            if isPressed.wrappedValue {
                isPressed.wrappedValue.toggle()
                timer?.invalidate()
            }
        }) {
            ZStack {
                Circle().strokeBorder(style: StrokeStyle(lineWidth: 2))
                Circle().fill(isPressed.wrappedValue ? .white : .red)
            }.frame(width: 100, height: 100, alignment: .center)
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Distance Covered in Km: \(distanceCovered)").font(.headline)
            ProgressView(value: distanceCovered > 0 ? distanceCovered : 0, total: 1000).frame(height: 40)
            
            HStack {
                ZStack {
                    circleShape(isPressed: $isLongPressD)
                    .simultaneousGesture(LongPressGesture(minimumDuration: 0.2)
                                            .updating($driveGestureState) { currentState, gestureState, transaction in
                            gestureState = currentState
                        transaction.animation = Animation.easeIn(duration: 2.0)
                        }
                        .onEnded { _ in
                        isLongPressD = true
                        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                            if distanceCovered < 1000 {
                                distanceCovered += 10
                            } else {
                                showOutOfGasAlert = true
                            }
                        })
                    })
                    
                    Text("D").bold().padding().foregroundColor(.green).font(.title)
                }.foregroundColor(.green)
                
                Spacer()
                
                ZStack {
                    circleShape(isPressed: $isLongPressR)
                    .simultaneousGesture(LongPressGesture(minimumDuration: 0.2).onEnded { _ in
                        isLongPressR = true
                        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                            if distanceCovered > 0 {
                                distanceCovered -= 10
                            }
                        })
                    })
                    
                    Text("R").bold().padding().foregroundColor(.blue).font(.title)
                }.foregroundColor(.green)
                
            }.padding()
        }.alert("Press D to Drive and R to Reverse", isPresented: $showDriveAlert) {
            Button("Okay") { showDriveAlert = false }
        }.alert("You ran out of Gas, Reverse to Gas Station", isPresented: $showOutOfGasAlert) {
            Button("Sucks, but fine!") { showOutOfGasAlert = false }
        }
        .padding()
    }
}

struct IgnitionDriveStackoverflowAnswer_Previews: PreviewProvider {
    static var previews: some View {
        IgnitionDriveStackoverflowAnswer()
    }
}
