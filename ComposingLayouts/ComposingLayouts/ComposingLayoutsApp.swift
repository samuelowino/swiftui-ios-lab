//
//  ComposingLayoutsApp.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI

@main
struct ComposingLayoutsApp: App {
    
    @StateObject private var model: ModelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
        
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
