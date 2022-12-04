//
//  FoodAreaMark.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 04/12/2022.
//

import SwiftUI
import Charts

struct FoodAreaMarkChart: View {
    var body: some View {
        Chart(riceCosts) { element in
            AreaMark(
                x: .value("Year", element.date),
                y: .value("Price", element.cost)
            )
            .foregroundStyle(.orange)
        }
        .padding()
        .navigationTitle("Rice Prices Between 2001 and 2007")
    }
}

struct FoodAreaMark_Previews: PreviewProvider {
    static var previews: some View {
        FoodAreaMarkChart()
    }
}
