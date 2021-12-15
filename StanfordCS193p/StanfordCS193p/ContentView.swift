//
//  ContentView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 10/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProgressIndicatorView()
                .tag("Progress Indicator")
            EmojiCardGameView()
                .tag("Emoji Game")
            MapView()
                .tag("Map")
            SpriteKit()
                .tag("SpriteKit")
            ColorPickerView()
                .tag("Color Picker")
            LazyVStackView()
                .tag("LazyVStack")
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(ColorScheme.dark)
    }
}
