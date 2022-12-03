//
//  CompanyProfits.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 03/12/2022.
//

import Foundation


struct CompanyProfits: Identifiable {
    var date: Date
    var profits: Double
    var branchname: String
    var id = UUID()
}

let nairobiBranchProfits: [CompanyProfits] = [
    .init(date: date(2022, 11, 1), profits: 10_000, branchname: "Nairobi"),
    .init(date: date(2022, 11, 2), profits: 11_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 3), profits: 10_500 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 4), profits: 5_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 5), profits: 16_300 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 6), profits: 18_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 7), profits: 18_700 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 8), profits: 20_500 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 9), profits: 19_600 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 10), profits: 21_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 11), profits: 22_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 12), profits: 18_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 13), profits: 60_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 14), profits: 30_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 15), profits: 60_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 16), profits: 70_000 ,branchname: "Nairobi"),
]

let kisumuBranchProfits: [CompanyProfits] = [
    .init(date: date(2022, 11, 1), profits: 10_000, branchname: "Kisumu"),
    .init(date: date(2022, 11, 2), profits: 10_300 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 3), profits: 10_400 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 4), profits: 9_800 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 5), profits: 10_900 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 6), profits: 11_000 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 7), profits: 10_900 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 8), profits: 19_500 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 9), profits: 15_600 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 10), profits: 18_000 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 11), profits: 17_000 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 12), profits: 17_0800 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 13), profits: 10_000 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 14), profits: 16_800 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 15), profits: 20_000 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 16), profits: 40_000 ,branchname: "Kisumu"),
]
