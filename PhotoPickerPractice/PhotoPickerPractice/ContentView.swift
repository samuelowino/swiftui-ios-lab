//
//  ContentView.swift
//  PhotoPickerPractice
//
//  Created by Samuel Owino on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var showPhotoPicker = false
    @State var error: Error?
    @State var image: Image?
    @State var assetIdentifier: String?
    var body: some View {
        VStack {
            if error != nil {
                Text("Image Loading Error: \(error!.localizedDescription)")
            }
            
            image?
                .resizable()
                .frame(height: 300)
                .padding(12)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Button("Open Photo Picker") {
                showPhotoPicker = true
            }
        }
        .padding()
        .sheet(isPresented: $showPhotoPicker, content: {
            PhotoPickerUIViewController(assetIdentifier: $assetIdentifier,
                                        loadingError: $error,
                                        image: $image)
                .presentationDetents([.medium])
        })
    }
}

#Preview {
    ContentView()
}
