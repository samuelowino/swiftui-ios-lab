//
//  ContentView.swift
//  GridViewLab
//
//  Created by Samuel Owino on 18/12/2023.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var isEmojiSelectorVisible = false
    @State private var keyboardHeight: CGFloat = 0

    var body: some View {
        VStack {
            ForEachImageView()
            
            TextField("Type something", text: .constant(""))
                .padding()
            
            Button("wtf") {
                
            }
            
            Spacer()
        }
        .keyboardObserving { keyboardFrame, visible in
            self.keyboardHeight = visible ? keyboardFrame.height : 0
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Show Emoji Selector") {
                    isEmojiSelectorVisible.toggle()
                }
            }
        }
        .overlay(
            Group {
                if isEmojiSelectorVisible {
                    EmojiSelector()
                        .offset(y: -keyboardHeight)
                }
            }
        )
    }
}

struct EmojiSelector: View {
    var body: some View {
        // Your custom emoji selector UI goes here
        // This is just a placeholder
        VStack {
            Text("😊")
            Text("😂")
            Text("🎉")
        }
        .padding()
        .background(Color.gray)
    }
}

extension View {
    func keyboardObserving(onChange: @escaping (CGRect, Bool) -> Void) -> some View {
        ModifiedContent(
            content: self,
            modifier: KeyboardObservingModifier(onChange: onChange)
        )
    }
}

struct KeyboardObservingModifier: ViewModifier {
    private var onChange: (CGRect, Bool) -> Void

    init(onChange: @escaping (CGRect, Bool) -> Void) {
        self.onChange = onChange
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                    if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                        self.onChange(keyboardFrame, true)
                    }
                }

                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                    self.onChange(.zero, false)
                }
            }
            .onDisappear {
                NotificationCenter.default.removeObserver(self)
            }
    }
}

#Preview {
    ContentView()
}
