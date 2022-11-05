//
//  FruitsRepository.swift
//  CombineCustomPubSub
//
//  Created by Samuel Owino on 05/11/2022.
//

import Foundation

struct FruitsRepository {
    func downloadFruits() -> [Fruit]{
        return [
            Fruit(name: "Apple", flavour: "Applish", icon: "🍎"),
            Fruit(name: "Oranges", flavour: "arangish", icon: "🍊"),
            Fruit(name: "Lemon", flavour: "Lemonadish", icon: "🍋"),
            Fruit(name: "Mangoe", flavour: "Mango flavour", icon: "🥭")
        ]
    }
}
