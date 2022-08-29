//
//  TsavoNationalParkApp.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 24/05/2022.
//

import SwiftUI

@main
struct TsavoNationalParkApp: App {
    
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SignupViewModel())
        }
        .onChange(of: scenePhase){ newScenePhase in
            if newScenePhase == ScenePhase.background {
                //empty cache
                //perform some network calls
                print("App is in the background")
            }
        }
    }
}
