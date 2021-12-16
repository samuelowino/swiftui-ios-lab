//
//  Int+.swift
//  freshOSNetworking
//
//  Created by Samuel Owino on 16/12/2021.
//

import Foundation

extension Int {
    func toSeconds() -> String {
        "\(self) s"
    }
    
    func toMinutes() -> String {
        "\(self / 60) min"
    }
    
    func toHours() -> String {
        "\(self / 60 / 60) h"
    }
    
    func toDays() -> String {
        "\(self / 60 / 60 / 24) days"
    }
    
    func toString() -> String {
        let days = self / 60 / 60 / 24
        let hours = self / 60 / 60 % 24
        let minutes = self / 60 % 60
        let seconds = self % 60
        return "\(days):\(hours < 10 ? "0\(hours)" : "\(hours)"):\(minutes < 10 ? "0\(minutes)" : "\(minutes)"):\(seconds < 10 ? "0\(seconds)" : "\(seconds)")"
    }
}
