//
//  Profile.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 01/12/2021.
//

import Foundation

struct Profile {
    var username: String
    var preferesNotifications: Bool = true
    var seasonalPhoto: Season = Season.winter
    var goalDate = Date()
    
    static var `default` = Profile(username: "owino")
}
