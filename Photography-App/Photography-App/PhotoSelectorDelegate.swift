//
//  PhotoSelectorDelegate.swift
//  Photography-App
//
//  Created by Samuel Owino on 14/07/2022.
//

import Foundation
import PhotosUI

class PhotoSelectorDelegate: NSObject, PHPickerViewControllerDelegate {

    var uiKitView: ImagePicker
    var selectedImage: UIImage?
    
    init(_ uiKitView: ImagePicker){
        self.uiKitView = uiKitView
    }
    
    //Called when a user selects a photo 🤳🏿
    //This won't automatically dismiss the picker though.. that's on you 😹
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true) // dismiss picker yourself, here ✅
        
        //check if result is empty...which means user did not select any image 🤷🏾‍♂️
        if results.isEmpty{
            return //exit 🏃🏽
        }
        
        //we are sure it's not empty... so we can call results.first!
        let selectedImageProvider = results.first!.itemProvider
        
        UserDefaults.standard.set(results.first!.assetIdentifier, forKey: "selected_photo_key")
        
        //check if what the user selected is an actual image and not some weird asset
        if selectedImageProvider.canLoadObject(ofClass: UIImage.self){
            //load the image asset to a UIImage instance
            selectedImageProvider.loadObject(ofClass: UIImage.self){ image, error in
                if let selectedImage = image as? UIImage {
                    self.uiKitView.image = selectedImage
                }
            }
        }
        
    }
}


