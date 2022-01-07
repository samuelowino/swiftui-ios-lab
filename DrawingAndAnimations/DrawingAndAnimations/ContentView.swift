//
//  ContentView.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 06/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Drawing and Animation")
                    .font(.title)
                
                List {
                    NavigationLink(destination: BadgeBackground()) {
                        Label("Badge Art", systemImage: "bolt.fill")
                    }
                    NavigationLink(destination: LinearGradientView()) {
                        Label("Gradient Colors", systemImage: "bolt.fill")
                    }
                }
                
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
