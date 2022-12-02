//
//  FoodTruckSingleBarChart.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 02/12/2022.
//

import SwiftUI
import Charts

struct FoodTruckSingleBarChart: View {
    var body: some View {
        VStack {
            HStack {
                Text("Most sold panacke")
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            HStack {
                Text("Caperso")
                    .multilineTextAlignment(.leading)
                    .bold()
                Spacer()
            }
            
            
            Chart(sales) { element in
                BarMark(
                    x: .value("Sales", element.sales),
                    y: .value("Name", element.pancakeName)
                )
            }
        }
        .padding()
        .navigationTitle("Food Truck Pancake Sales")

    }
}

struct FoodTruckSingleBarChart_Previews: PreviewProvider {
    static var previews: some View {
        FoodTruckSingleBarChart()
    }
}
