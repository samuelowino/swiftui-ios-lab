//
//  ApolloStageBurnData.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 04/12/2022.
//

import Foundation

struct ApolloStageBurnData: Identifiable {
    var id = UUID()
    let durationSecond: Double
    let stage: String
    let rocket: String
}

let stageBurnData: [ApolloStageBurnData] = [
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 7"),
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 8"),
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 9"),
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 10"),
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 11"),
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 12"),
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 13"),
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 14"),
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 15"),
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 16"),
    .init(durationSecond: 0, stage: "Pre-Staging", rocket: "Apollo 17"),
    
    .init(durationSecond: 147.31, stage: "S-IC Stage Burn", rocket: "Apollo 7"),
    .init(durationSecond: 160.41, stage: "S-IC Stage Burn", rocket: "Apollo 8"),
    .init(durationSecond: 169.06, stage: "S-IC Stage Burn", rocket: "Apollo 9"),
    .init(durationSecond: 168.03, stage: "S-IC Stage Burn", rocket: "Apollo 10"),
    .init(durationSecond: 168.03, stage: "S-IC Stage Burn", rocket: "Apollo 11"),
    .init(durationSecond: 168.2, stage: "S-IC Stage Burn", rocket: "Apollo 12"),
    .init(durationSecond: 170.3, stage: "S-IC Stage Burn", rocket: "Apollo 13"),
    .init(durationSecond: 170.6, stage: "S-IC Stage Burn", rocket: "Apollo 14"),
    .init(durationSecond: 166.1, stage: "S-IC Stage Burn", rocket: "Apollo 15"),
    .init(durationSecond: 168.5, stage: "S-IC Stage Burn", rocket: "Apollo 16"),
    .init(durationSecond: 168.1, stage: "S-IC Stage Burn", rocket: "Apollo 17"),
    
    .init(durationSecond: 0, stage: "S-II Stage Burn", rocket: "Apollo 7"),
    .init(durationSecond: 367.85, stage: "S-II Stage Burn", rocket: "Apollo 8"),
    .init(durationSecond: 371.06, stage: "S-II Stage Burn", rocket: "Apollo 9"),
    .init(durationSecond: 388.59, stage: "S-II Stage Burn", rocket: "Apollo 10"),
    .init(durationSecond: 384.22, stage: "S-II Stage Burn", rocket: "Apollo 11"),
    .init(durationSecond: 389.14, stage: "S-II Stage Burn", rocket: "Apollo 12"),
    .init(durationSecond: 426.64, stage: "S-II Stage Burn", rocket: "Apollo 13"),
    .init(durationSecond: 392.55, stage: "S-II Stage Burn", rocket: "Apollo 14"),
    .init(durationSecond: 386.06, stage: "S-II Stage Burn", rocket: "Apollo 15"),
    .init(durationSecond: 394.34, stage: "S-II Stage Burn", rocket: "Apollo 16"),
    .init(durationSecond: 395.06, stage: "S-II Stage Burn", rocket: "Apollo 17"),
    
    .init(durationSecond: 469.79, stage: "S-IVB First Burn", rocket: "Apollo 7"),
    .init(durationSecond: 156.69, stage: "S-IVB First Burn", rocket: "Apollo 8"),
    .init(durationSecond: 123.84, stage: "S-IVB First Burn", rocket: "Apollo 9"),
    .init(durationSecond: 146.95, stage: "S-IVB First Burn", rocket: "Apollo 10"),
    .init(durationSecond: 147.13, stage: "S-IVB First Burn", rocket: "Apollo 11"),
    .init(durationSecond: 137.31, stage: "S-IVB First Burn", rocket: "Apollo 12"),
    .init(durationSecond: 152.93, stage: "S-IVB First Burn", rocket: "Apollo 13"),
    .init(durationSecond: 137.16, stage: "S-IVB First Burn", rocket: "Apollo 14"),
    .init(durationSecond: 141.47, stage: "S-IVB First Burn", rocket: "Apollo 15"),
    .init(durationSecond: 142.61, stage: "S-IVB First Burn", rocket: "Apollo 16"),
    .init(durationSecond: 138.85, stage: "S-IVB First Burn", rocket: "Apollo 17"),
    
    .init(durationSecond: 0, stage: "S-IVB Third Burn", rocket: "Apollo 7"),
    .init(durationSecond: 317.72, stage: "S-IVB Third Burn", rocket: "Apollo 8"),
    .init(durationSecond: 62.06, stage: "S-IVB Third Burn", rocket: "Apollo 9"),
    .init(durationSecond: 343.06, stage: "S-IVB Third Burn", rocket: "Apollo 10"),
    .init(durationSecond: 346.83, stage: "S-IVB Third Burn", rocket: "Apollo 11"),
    .init(durationSecond: 341.14, stage: "S-IVB Third Burn", rocket: "Apollo 12"),
    .init(durationSecond: 350.85, stage: "S-IVB Third Burn", rocket: "Apollo 13"),
    .init(durationSecond: 350.84, stage: "S-IVB Third Burn", rocket: "Apollo 14"),
    .init(durationSecond: 350.71, stage: "S-IVB Third Burn", rocket: "Apollo 15"),
    .init(durationSecond: 341.92, stage: "S-IVB Third Burn", rocket: "Apollo 16"),
    .init(durationSecond: 351.04, stage: "S-IVB Third Burn", rocket: "Apollo 17")
]
