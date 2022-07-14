//
//  ContentView.swift
//  Photography-App
//
//  Created by Samuel Owino on 14/07/2022.
//

import SwiftUI
import Photos

struct ContentView: View {
    
    @Environment(\.isPresented) private var isPresented
    
    @State private var uiImage: UIImage?
    @State private var selectedImage: Image?
    @State var showImagePicker: Bool = false
    var body: some View {
        VStack {
            selectedImage?.resizable().scaledToFit()
            
            Button("Select Photo"){
                showImagePicker = true
            }
        }
        .onAppear {
            loadImage()
        }
        .sheet(isPresented: $showImagePicker){
            ImagePicker(image: $uiImage)
        }.onChange(of: uiImage){ optionalUIImage in
            if let inputImage = optionalUIImage {
                selectedImage = Image(uiImage: inputImage)
            }
        }
    }
    
    func loadImage(){
        if let imageIdentifier = UserDefaults.standard.string(forKey: "selected_photo_key"){
            //load actual image since identifier was store already

            let fetchResult: PHFetchResult<PHAsset> = PHAsset.fetchAssets(withLocalIdentifiers: [imageIdentifier], options: nil)
            
            if let phAsset = fetchResult.firstObject {
                
                let imageManager = PHImageManager()

                imageManager.requestImage(for: phAsset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: nil) { (resultImage, _ ) in
                                        
                    if let previouslySelectedImage = resultImage {
                        self.selectedImage = Image(uiImage: previouslySelectedImage)
                    }
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
