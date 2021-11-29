//
//  chapter_oneApp.swift
//  chapter-one
//
//  Created by Samuel Owino on 26/11/2021.
//

import SwiftUI

/**
 An app that uses SwiftUI app life cycle has a structure that conforms to the App protocol.
 The structure's body returns one or more scences, which inturn provide content for display.
 The @main attribute identies the apps entry point.
 
 */

@main
struct ChapterOneApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
