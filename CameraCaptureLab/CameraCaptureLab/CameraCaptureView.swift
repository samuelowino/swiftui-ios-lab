//
//  CameraCaptureView.swift
//  CameraCaptureLab
//
//  Created by Samuel Owino on 22/01/2024.
//
import SwiftUI
import UIKit
import Foundation

struct CameraCaptureView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let cameraView = UIImagePickerController()
        cameraView.sourceType = .camera
        return cameraView
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
}
