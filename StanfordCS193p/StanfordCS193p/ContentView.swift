//
//  ContentView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 10/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    var emojis: [String] = ["🛻","✈️","🚑","🛴","🛫","🛵","⛴","🚢","⛰","🏗"]
    @State var emojiCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(emoji: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }.foregroundColor(.red)
            }
            
            Spacer()
            
            HStack {
                
                removeButton
                
                Spacer()
                
                addButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var addButton: some View {
        Button {
            if emojis.count > emojiCount {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeButton: some View {
        Button {
            if emojiCount  > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View {
    
    var emoji: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        
        let shape = RoundedRectangle(cornerRadius: 20)

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
