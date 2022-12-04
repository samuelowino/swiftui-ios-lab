//
//  FoodData.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 04/12/2022.
//

import Foundation


struct FoodPrice: Identifiable {
    var id = UUID()
    var name: String
    var cost: Double
    var date: Date
    
    init(name: String, cost: Double, year: Int){
        self.name = name
        self.cost = cost
        
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: year))!
    }
}


let riceCosts: [FoodPrice] = [
    .init(name: "Rice", cost: 100, year: 2002),
    .init(name: "Rice", cost: 150, year: 2003),
    .init(name: "Rice", cost: 200, year: 2004),
    .init(name: "Rice", cost: 217, year: 2005),
    .init(name: "Rice", cost: 300, year: 2006),
    .init(name: "Rice", cost: 450, year: 2007),
]

let cerealsPrices: [FoodPrice] = [
    .init(name: "Rice", cost: 100, year: 2002),
    .init(name: "Green Grams", cost: 80, year: 2002),
    .init(name: "Pease", cost: 250, year: 2002),
    
    .init(name: "Rice", cost: 150, year: 2003),
    .init(name: "Green Grams", cost: 90, year: 2003),
    .init(name: "Pease", cost: 300, year: 2003),
    
    .init(name: "Rice", cost: 200, year: 2004),
    .init(name: "Green Grams", cost: 95, year: 2004),
    .init(name: "Pease", cost: 270, year: 2004),
    
    .init(name: "Rice", cost: 217, year: 2005),
    .init(name: "Green Grams", cost: 110, year: 2005),
    .init(name: "Pease", cost: 280, year: 2005),
    
    .init(name: "Rice", cost: 300, year: 2006),
    .init(name: "Green Grams", cost: 100, year: 2006),
    .init(name: "Pease", cost: 330, year: 2006),
    
    .init(name: "Rice", cost: 500, year: 2007),
    .init(name: "Green Grams", cost: 150, year: 2007),
    .init(name: "Pease", cost: 490, year: 2007),
]
