//
//  Pancake.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 02/12/2022.
//

import Foundation


struct PancakeSales: Identifiable{
    var id = UUID()
    let pancakeName: String
    let sales: Double
}

let sales: [PancakeSales] = [
    .init(pancakeName: "Cachapa", sales: 453),
    .init(pancakeName: "Injera", sales: 353),
    .init(pancakeName: "Crepa", sales: 343),
    .init(pancakeName: "Jian Bang", sales: 333),
    .init(pancakeName: "Dosa", sales: 323),
    .init(pancakeName: "American", sales: 253),
]
