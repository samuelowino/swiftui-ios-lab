//
//  NotePadView.swift
//  SwiftUIToolbars
//
//  Created by Samuel Owino on 07/12/2022.
//

import SwiftUI

struct NotePadView: View {
    @State var notes: String = "Brown white fox entered the shed"
    @State var bold: Bool = false
    @State var italic: Bool = false
    @State var fontSize: Double = 12.5
    
    var displayFont: Font {
        let font = Font.system(size: CGFloat(fontSize),
                               weight: bold == true ? .bold : .regular)
        return italic == true ? font.italic() : font
    }
    
    var body: some View {
        VStack {
            TextEditor(text: $notes)
                .font(displayFont)
        }
        .toolbar {
            ToolbarItemGroup {
                Slider(value: $fontSize,
                       in: 8...125,
                       minimumValueLabel: Text("A"),
                       maximumValueLabel: Text("B"))
                {
                    Text("Font Size")
                }
                .frame(width: 150)
                
                Toggle("Bold", isOn: $bold)
                
                Toggle("Italic", isOn: $italic)
            }
        }
        .navigationTitle("Toolbar Lab")
        .padding()
    }
}

struct NotePadView_Previews: PreviewProvider {
    static var previews: some View {
        NotePadView()
    }
}
