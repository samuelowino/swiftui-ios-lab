//
//  AppNotificationUtils.swift
//  AppleDeviceNotifications
//
//  Created by Samuel Owino on 03/02/2022.
//

import Foundation
import UserNotifications
import PushKit

struct AppNotificationUtils {
    
    public static func requestProvisionalNotificationPermissions(completionHandler: @escaping(Error?, Bool) -> ()){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound, .provisional]) { granted, error in
            if let error = error {
                completionHandler(error, granted)
            } else {
                completionHandler(nil, granted)
            }
        }
    }
    
    public static func checkNotificationPermissionsStatus(completionHandler: @escaping(UNNotificationSettings) -> ()) {
        UNUserNotificationCenter.current().getNotificationSettings { notificationSettings in
            completionHandler(notificationSettings)
        }
    }
}
