//
//  ContentView.swift
//  CameraCaptureLab
//
//  Created by Samuel Owino on 22/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var openCamera = false
    var body: some View {
        VStack {
            Button("Open Camera") {
                openCamera = true
            }
        }
        .padding()
        .fullScreenCover(isPresented: $openCamera, content: {
            CameraCaptureView()
        })
    }
}

#Preview {
    ContentView()
}
