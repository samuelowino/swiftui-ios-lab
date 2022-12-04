//
//  ApolloStageBurnChart.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 04/12/2022.
//

import SwiftUI
import Charts

struct ApolloStageBurnChart: View {
    var body: some View {
        Chart(stageBurnData) { element in
            PointMark(
                x: .value("Rocket", element.rocket),
                y: .value("Burn Duration", element.durationSecond)
            )
            .foregroundStyle(by: .value("Stage", element.stage))
        }
        .padding()
        .navigationTitle("Apollo Rockets Ascent Data")
    }
}

struct ApolloStageBurnChart_Previews: PreviewProvider {
    static var previews: some View {
        ApolloStageBurnChart()
    }
}
