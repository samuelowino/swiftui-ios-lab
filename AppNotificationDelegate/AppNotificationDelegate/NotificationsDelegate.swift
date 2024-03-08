//
//  NotificationsDelegate.swift
//  AppNotificationDelegate
//
//  Created by Samuel Owino on 08/03/2024.
//

import Foundation
import UserNotifications
class NotificationsDelegate: NSObject,UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return UNNotificationPresentationOptions(arrayLiteral: [.banner, .sound, .badge, .list])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("did receive notification")
        center.getDeliveredNotifications { delivered in
            delivered.forEach { print("Delivered: \($0.debugDescription)")}
        }
        completionHandler()
    }
}
