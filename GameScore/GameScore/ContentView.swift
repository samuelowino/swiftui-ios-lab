//
//  ContentView.swift
//  GameScore
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var settings = GameSettings()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Button("Increase Score") {
                    settings.score += 1
                }
                
                NavigationLink(destination: ScoreView()) {
                    Text("Show details")
                }
            }.frame(height: 200)
        }.environmentObject(settings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
