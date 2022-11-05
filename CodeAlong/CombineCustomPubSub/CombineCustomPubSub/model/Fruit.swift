//
//  Fruit.swift
//  CombineCustomPubSub
//
//  Created by Samuel Owino on 05/11/2022.
//

import Foundation

struct Fruit: Identifiable {
    var id: UUID = UUID()
    var name: String
    var flavour: String
    var icon: String
}
