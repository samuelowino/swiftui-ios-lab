//
//  PhotoPickerViewController.swift
//  PhotoPickerPractice
//
//  Created by Samuel Owino on 18/01/2024.
//

import SwiftUI
import PhotosUI

struct PhotoPickerUIViewController: UIViewControllerRepresentable {
    
    @Binding var assetIdentifier: String?
    @Binding var loadingError: Error?
    @Binding var image: Image?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = PHPickerFilter.images
        config.selectionLimit = 1
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPickerUIViewController
        
        init(parent: PhotoPickerUIViewController) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            guard !results.isEmpty else { return }
            guard let result: PHPickerResult = results.first else { return }
            parent.assetIdentifier = result.assetIdentifier
            let itemProvider: NSItemProvider = result.itemProvider
            guard itemProvider.canLoadObject(ofClass: UIImage.self) else { return }
            itemProvider.loadObject(ofClass: UIImage.self) { providerReading, error in
                if let error {
                    self.parent.loadingError = error
                    return
                }
                
                if let image = providerReading as? UIImage {
                    self.parent.image = Image(uiImage: image)
                }
            }
            
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}
