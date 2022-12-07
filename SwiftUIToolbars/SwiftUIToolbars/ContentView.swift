//
//  ContentView.swift
//  SwiftUIToolbars
//
//  Created by Samuel Owino on 07/12/2022.
//

import SwiftUI

struct ContentView: View {
    
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
        NavigationView {
            VStack {
                NavigationLink(destination: NotePadView()){
                    Label("New Entry", systemImage: "text.book.closed")
                        .font(.headline)
                        .bold()
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
