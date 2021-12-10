//
//  ContentView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 10/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    var emojis: [String] = ["🛻","✈️","🚑","🛴","🛫","🛵","⛴","🚢","⛰","🏗"]
    
    var body: some View {
        HStack {
            ForEach(emojis[0..<4], id: \.self) { emoji in
                CardView(emoji: emoji)
            }
        }
    }
}

struct CardView: View {
    
    var emoji: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        
        let shape = Circle()

        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                
                shape.stroke(lineWidth: 3)
                
                Text(emoji)
                    .font(.title)
            } else {
                shape.fill()
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(ColorScheme.dark)
    }
}
