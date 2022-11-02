//
//  MonitorScenePhaseApp.swift
//  MonitorScenePhase
//
//  Created by Samuel Owino on 02/11/2022.
//

import SwiftUI

@main
struct MonitorScenePhaseApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    @State var scenePhaseState: String = "Unknown"
    
    var body: some Scene {
        WindowGroup {
            ContentView(scenePhaseState: $scenePhaseState)
        }
        .onChange(of: scenePhase){ newScenePhase in
            if newScenePhase == .background {
                scenePhaseState = "Background"
                print("Scene phase is in background mode...")
            } else if newScenePhase == .inactive {
                scenePhaseState = "Inactive"
                print("Scene phase is in 'inactive' state...")
            } else if newScenePhase == .active {
                scenePhaseState = "Active"
                print("Scene phase is in 'active' state...")
            } else {
                scenePhaseState = "Unknown"
                print("Unknow scene phase state 🛑")
            }
        }
    }
}
