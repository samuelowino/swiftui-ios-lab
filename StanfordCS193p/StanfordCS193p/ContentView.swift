//
//  ContentView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 10/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
        }
    }
}

struct CardView: View {
    
    var isFaceUp: Bool
    
    var body: some View {
        
        let shape = RoundedRectangle(cornerRadius: 20)

        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                
                shape.stroke(lineWidth: 3)
                
                Text("✈️")
                    .padding()
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(ColorScheme.dark)
        
        ContentView()
            .preferredColorScheme(.light)
    }
}
