//
//  Season.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 01/12/2021.
//

import Foundation

enum Season: String, CaseIterable, Identifiable {
    case spring = "🌷"
    case summer = "🌞"
    case autumn = "🍂"
    case winter = "☃️"
    
    var id: String { rawValue }
}
