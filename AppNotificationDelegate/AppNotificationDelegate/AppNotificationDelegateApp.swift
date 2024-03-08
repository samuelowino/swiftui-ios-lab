//
//  AppNotificationDelegateApp.swift
//  AppNotificationDelegate
//
//  Created by Samuel Owino on 08/03/2024.
//

import SwiftUI

@main
struct AppNotificationDelegateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegatesParent.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
