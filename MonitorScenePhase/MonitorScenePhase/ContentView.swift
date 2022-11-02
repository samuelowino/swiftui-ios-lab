//
//  ContentView.swift
//  MonitorScenePhase
//
//  Created by Samuel Owino on 02/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var scenePhaseState: String
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Scene Phase State: \(scenePhaseState)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scenePhaseState: .constant("Unknown State"))
    }
}
