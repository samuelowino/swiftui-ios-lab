//
//  multisceneApp.swift
//  multiscene
//
//  Created by Samuel Owino on 05/01/2024.
//

import SwiftUI

@main
struct multisceneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        WindowGroup {
            OtherView()
        }
        
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
                    NavigationLink("Open Another View", destination: OtherView())
                        .padding()
                        .navigationBarTitle("Main View")
                }
    }
}

struct OtherView: View {
    var body: some View {
        Text("Another View")
            .padding()
    }
}

struct SettingsView: View {
    var body: some View {
        Text("App Settings")
            .padding()
    }
    
}
