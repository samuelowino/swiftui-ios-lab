//
//  AppDelegatesParent.swift
//  AppNotificationDelegate
//
//  Created by Samuel Owino on 08/03/2024.
//

import Foundation
import UIKit
class AppDelegatesParent: NSObject, UIApplicationDelegate {
    let notificationsDelegate = NotificationsDelegate()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = notificationsDelegate
        return true
    }
}
