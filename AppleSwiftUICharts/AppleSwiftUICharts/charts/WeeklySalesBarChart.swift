//
//  WeeklySalesBarChart.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 02/12/2022.
//

import SwiftUI
import Charts

struct WeeklySalesBarChart: View {
    var body: some View {
        Chart(seriesData) { series in
            ForEach(series.sales){ element in
                BarMark(
                    x: .value("Day", element.weekday, unit: .day),
                    y: .value("Sales", element.sales)
                )
                .foregroundStyle(by: .value("City", series.city))
                .cornerRadius(8)
            }
        }
        .chartForegroundStyleScale([
            "Capertino": .orange, "San Fransisco": .green
        ])
        .padding()
        .navigationTitle("Weekly Sales")
    }
}

struct WeeklySalesBarChart_Previews: PreviewProvider {
    static var previews: some View {
        WeeklySalesBarChart()
    }
}
