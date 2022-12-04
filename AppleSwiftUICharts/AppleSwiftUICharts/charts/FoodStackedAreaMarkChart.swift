//
//  FoodStackedAreaMarkChart.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 04/12/2022.
//

import SwiftUI
import Charts

struct FoodStackedAreaMarkChart: View {
    var body: some View {
        Chart(cerealsPrices) { element in
            AreaMark(
                x: .value("Year", element.date),
                y: .value("Price", element.cost)
            )
            .foregroundStyle(by: .value("Food Item", element.name))
        }
        .padding()
    }
}

struct FoodStackedAreaMarkChart_Previews: PreviewProvider {
    static var previews: some View {
        FoodStackedAreaMarkChart()
    }
}
