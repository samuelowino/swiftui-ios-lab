//
//  ImagePicker.swift
//  Photography-App
//
//  Created by Samuel Owino on 14/07/2022.
//

import PhotosUI
import SwiftUI

//Since we are in SwiftUI, extend UIViewControllerRepresentable
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        
        let filter = PHPickerFilter.any(of: [.images])
        configuration.filter = filter
        configuration.selection = .ordered
        //configuration.selectionLimit = 5 Use if you want to select multiple images
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> PhotoSelectorDelegate {
        PhotoSelectorDelegate(self)
    }
}
