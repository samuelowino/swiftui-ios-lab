//
//  CustomUIKitButton.swift
//  UIKitButton
//
//  Created by Samuel Owino on 12/01/2024.
//

import Foundation
import SwiftUI
import UIKit

struct CustomUIKitButton: UIViewRepresentable {
    let onButtonTap: () -> Void
    var uiButton: UIButton = UIButton(type: .roundedRect)
    
    init(onButtonTap: @escaping () -> Void) {
        self.onButtonTap = onButtonTap
    }
    
    class Coordinator: NSObject {
        
        var parent: CustomUIKitButton
        
        init(parent: CustomUIKitButton) {
            self.parent = parent
        }
        
        @objc func buttonTapped() {
            parent.uiButton.setTitle("Likes: \(Int.random(in: 0...500))", for: .normal)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        uiButton.setTitle("UIKit Button", for: .normal)
        uiButton.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .touchUpInside)
        return uiButton
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
