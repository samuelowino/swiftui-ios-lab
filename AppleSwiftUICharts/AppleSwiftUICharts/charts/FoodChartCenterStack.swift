//
//  FoodChartCenterStack.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 04/12/2022.
//

import SwiftUI
import Charts

struct FoodChartCenterStack: View {
    var body: some View {
        Chart(cerealsPrices) { element in
            AreaMark(
                x: .value("Year", element.date),
                y: .value("Price", element.cost),
                stacking: .center
            )
            .foregroundStyle(by: .value("Food Item", element.name))
        }
        .padding()
        .navigationTitle("Cereals Prices Between 2002 and 2007")
    }
}

struct FoodChartCenterStack_Previews: PreviewProvider {
    static var previews: some View {
        FoodChartCenterStack()
    }
}
