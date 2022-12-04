//
//  SunshineData.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 04/12/2022.
//

import Foundation


struct hoursOfSunshine: Identifiable {
    var id =  UUID()
    var date: Date
    var county: String
    var hoursOfSunshine: Double
    
    init(month: Int, hoursOfSunshine: Double, county: String){
        self.hoursOfSunshine = hoursOfSunshine
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: 2022, month: month))!
        self.county = county
    }
}

let sunshineData: [hoursOfSunshine] = [
    .init(month: 1, hoursOfSunshine: 90, county: "Nairobi"),
    .init(month: 1, hoursOfSunshine: 94, county: "Kisumu"),
    .init(month: 1, hoursOfSunshine: 110, county: "Garisa"),
    
    .init(month: 2, hoursOfSunshine: 89, county: "Nairobi"),
    .init(month: 2, hoursOfSunshine: 90, county: "Kisumu"),
    .init(month: 2, hoursOfSunshine: 110, county: "Garisa"),
    
    .init(month: 3, hoursOfSunshine: 20, county: "Nairobi"),
    .init(month: 3, hoursOfSunshine: 79, county: "Kisumu"),
    .init(month: 3, hoursOfSunshine: 110, county: "Garisa"),
    
    .init(month: 4, hoursOfSunshine: 25, county: "Nairobi"),
    .init(month: 4, hoursOfSunshine: 60, county: "Kisumu"),
    .init(month: 4, hoursOfSunshine: 100, county: "Garisa"),
    
    .init(month: 5, hoursOfSunshine: 30, county: "Nairobi"),
    .init(month: 5, hoursOfSunshine: 70, county: "Kisumu"),
    .init(month: 5, hoursOfSunshine: 90, county: "Garisa"),
    
    .init(month: 6, hoursOfSunshine: 60, county: "Nairobi"),
    .init(month: 6, hoursOfSunshine: 60, county: "Kisumu"),
    .init(month: 6, hoursOfSunshine: 95, county: "Garisa"),
    
    .init(month: 7, hoursOfSunshine: 10, county: "Nairobi"),
    .init(month: 7, hoursOfSunshine: 80, county: "Kisumu"),
    .init(month: 7, hoursOfSunshine: 100, county: "Garisa"),
    
    .init(month: 8, hoursOfSunshine: 15, county: "Nairobi"),
    .init(month: 8, hoursOfSunshine: 65, county: "Kisumu"),
    .init(month: 8, hoursOfSunshine: 115, county: "Garisa"),
    
    .init(month: 9, hoursOfSunshine: 77, county: "Nairobi"),
    .init(month: 9, hoursOfSunshine: 97, county: "Kisumu"),
    .init(month: 9, hoursOfSunshine: 177, county: "Garisa"),
    
    .init(month: 10, hoursOfSunshine: 80, county: "Nairobi"),
    .init(month: 10, hoursOfSunshine: 80, county: "Kisumu"),
    .init(month: 10, hoursOfSunshine: 90, county: "Garisa"),
    
    .init(month: 11, hoursOfSunshine: 79, county: "Nairobi"),
    .init(month: 11, hoursOfSunshine: 79, county: "Kisumu"),
    .init(month: 11, hoursOfSunshine: 99, county: "Garisa"),
    
    .init(month: 12, hoursOfSunshine: 47, county: "Nairobi"),
    .init(month: 12, hoursOfSunshine: 67, county: "Kisumu"),
    .init(month: 12, hoursOfSunshine: 97, county: "Garisa")
]
