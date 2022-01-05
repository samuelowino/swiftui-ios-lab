//
//  ContentView.swift
//  CoreGestures
//
//  Created by Samuel Owino on 31/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Spacer()
                    Text("SwiftUI Core Gestures")
                        .bold()
                        .font(.title)
                        .foregroundColor(Color("AccentColor"))
                    Spacer()
                }
                NavigationLink(destination: IgnitionDriveView()){
                    Label("Single Press Drive", systemImage: "car")
                }
                
                NavigationLink(destination: IgnitionDriveStackoverflowAnswer()){
                    Label("Stackoverflow Answer", systemImage: "bolt")
                }
                
                NavigationLink(destination: LongPressGestureDocsSample()){
                    Label("Apple Docs Sample", systemImage: "book")
                }
                
                NavigationLink(destination: DragGestureViewBasic()){
                    Label("Drag Gesture", systemImage: "hand.draw")
                }
                
                NavigationLink(destination: MagnifyGestureView()){
                    Label("Magnify Gesture", systemImage: "hand.point.up.braille")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
