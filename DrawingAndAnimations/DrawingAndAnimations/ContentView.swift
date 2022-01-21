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
                    NavigationLink(destination: BadgeView()) {
                        Label("Badge Art", systemImage: "bolt.fill")
                    }
                    NavigationLink(destination: GradientViews()) {
                        Label("Gradient Colors", systemImage: "bolt.fill")
                    }
                    
                    NavigationLink(destination: DrawingPaths()) {
                        Label("Drawing Paths", systemImage: "bolt.fill")
                    }
                    
                    NavigationLink(destination: CanvasView()) {
                        Label("Canvas", systemImage: "bolt.fill")
                    }
                    
                    NavigationLink(destination: CanvasParticlesView()) {
                        Label("Canvas: Particle System", systemImage: "bolt.fill")
                    }
                    
                    NavigationLink(destination: TimeLineView()) {
                        Label("Timeline View", systemImage: "bolt.fill")
                    }
                    
                    NavigationLink(destination: MorePathsExercise()) {
                        Label("Path, Shapes & Tranform", systemImage: "bolt.fill")
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
