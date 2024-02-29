//
//  ContentView.swift
//  UITextViewLab
//
//  Created by Samuel Owino on 23/02/2024.
//
import SwiftUI
import UIKit
struct ContentView: View {
    @State var text: NSMutableAttributedString = NSMutableAttributedString()
    @State var editingMenu: Bool = false
    @State var selectedRange: NSRange = .init()
    @State var textView: UITextView = UITextView()
    var body: some View {
        NavigationView {
            VStack {
                UITextViewRepresentable(textView: textView, text: $text, range: $selectedRange)
                    .background(.primary)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Image(systemName: "bold.underline")
                        .foregroundColor(.blue)
                        .padding()
                        .onTapGesture {
                            editingMenu = true
                        }
                }
            }
            .onAppear {
                text.string = NSMutableAttributedString(string: "As mentioned in Source 1, starting from iOS 6.0. It's important to note that while the attributes are applied immediately to the UITextView")
            }
            .sheet(isPresented: $editingMenu){
                HStack {
                    Image(systemName: "bold")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                        .onTapGesture {
                            print("Apply attributes")
                            print("text \(text)")
                            print("selected range: \(selectedRange)")
                            text.setAttributes([.font:Font.system(size: 21, weight: .bold)], range: selectedRange)
                            textView.setNeedsDisplay()
                        }
                    Image(systemName: "italic")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                    Image(systemName: "underline")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                }
                .presentationDetents([.medium])
            }
        }
    }
}
struct UITextViewRepresentable: UIViewRepresentable {
    var textView: UITextView
    @Binding var text: NSMutableAttributedString
    @Binding var range: NSRange
    func makeUIView(context: Context) -> UITextView {
        textView.delegate = context.coordinator
        return textView
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        // SwiftUI -> UIKit
        uiView.attributedText = NSMutableAttributedString(attributedString: text)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, range: $range)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: NSMutableAttributedString
        @Binding var range: NSRange
        init(text: Binding<NSMutableAttributedString>, range: Binding<NSRange>) {
            self._text = text
            self._range = range
        }
        
        func textViewDidChange(_ textView: UITextView) {
            // UIKit -> SwiftUI
            if let string = textView.attributedText {
                _text.wrappedValue = NSMutableAttributedString(attributedString: string)
            }
        }
        
        func textViewDidChangeSelection(_ textView: UITextView) {
            // Fires off every time the user changes the selection.
            print(textView.selectedRange)
            range = textView.selectedRange
        }
    }
}
#Preview {
    ContentView()
}
