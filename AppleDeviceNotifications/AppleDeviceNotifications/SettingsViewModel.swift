//
//  SettingsViewModel.swift
//  AppleDeviceNotifications
//
//  Created by Samuel Owino on 03/02/2022.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    @Published var notificationPermissionGranted: Bool = false
    @Published var permissinStatusDescription: String = "Permissin Status: Denied"
    
    public func checkPermissionStatus(){
        AppNotificationUtils.checkNotificationPermissionsStatus { settings in
            if settings.authorizationStatus == .provisional {
                self.permissinStatusDescription = "Provisional (Temporarily Granted (limited)) 💙"
            } else if settings.authorizationStatus == .denied {
                self.permissinStatusDescription = "Permission Denier 💔"
            } else if settings.authorizationStatus == .notDetermined {
                self.permissinStatusDescription = "Not Determined 💛"
            } else if settings.authorizationStatus == .authorized {
                self.permissinStatusDescription = "Permission Granted ❤️ 💗"
            }
        }
    }
}

