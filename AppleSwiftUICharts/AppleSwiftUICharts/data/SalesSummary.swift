//
//  SalesSummary.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 02/12/2022.
//

import Foundation

struct SalesSummary: Identifiable {
    let weekday: Date
    let sales: Double
    var id = UUID()
}

let capertinoSales: [SalesSummary] = [
    .init(weekday: date(2022, 5, 2), sales: 54),
    .init(weekday: date(2022, 5, 3), sales: 42),
    .init(weekday: date(2022, 5, 4), sales: 88),
    .init(weekday: date(2022, 5, 5), sales: 44),
    .init(weekday: date(2022, 5, 6), sales: 34),
    .init(weekday: date(2022, 5, 7), sales: 74),
    .init(weekday: date(2022, 5, 8), sales: 24),
]

let sfSales: [SalesSummary] = [
    .init(weekday: date(2022, 5, 2), sales: 104),
    .init(weekday: date(2022, 5, 3), sales: 22),
    .init(weekday: date(2022, 5, 4), sales: 108),
    .init(weekday: date(2022, 5, 5), sales: 54),
    .init(weekday: date(2022, 5, 6), sales: 14),
    .init(weekday: date(2022, 5, 7), sales: 4),
    .init(weekday: date(2022, 5, 8), sales: 124),
]

func date(_ year: Int, _ month: Int, _ dayOfMonth: Int) -> Date {
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.month = month
    dateComponents.day = dayOfMonth
    
    let userCalendar = Calendar(identifier: .gregorian)
    return userCalendar.date(from: dateComponents)!
    
}

struct SalesSeries: Identifiable {
    let city: String
    let sales: [SalesSummary]
    
    var id = UUID()
}

let seriesData: [SalesSeries] = [
    .init(city: "Capertino", sales: capertinoSales),
    .init(city: "San Fransisco", sales: sfSales),
]
