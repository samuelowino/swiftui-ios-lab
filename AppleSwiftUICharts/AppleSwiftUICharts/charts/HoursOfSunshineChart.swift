//
//  MonthlyHoursOfSunshineChart.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 04/12/2022.
//

import SwiftUI
import Charts

struct HoursOfSunshineChart: View {
    var body: some View {
        Chart(sunshineData) { element in
            LineMark(
                x: .value("Date", element.date),
                y: .value("Sun 🌞 Hours", element.hoursOfSunshine)
            )
            .foregroundStyle(by: .value("County", element.county))
        }
        .padding()
        .navigationTitle("Sunshines Hours")
    }
}

struct MonthlyHoursOfSunshineChart_Previews: PreviewProvider {
    static var previews: some View {
        HoursOfSunshineChart()
    }
}
