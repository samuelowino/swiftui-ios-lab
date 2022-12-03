//
//  CompanyProfitsChart.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 03/12/2022.
//

import SwiftUI
import Charts

struct CompanyProfitsChart: View {
    var body: some View {
        Chart {
            ForEach(nairobiBranchProfits){ element in
                LineMark(
                    x: .value("Date", element.date),
                    y: .value("Profits", element.profits),
                    series: .value("Nairobi Branch", "Nairobi")
                )
                .foregroundStyle(.green)
            }
            
            ForEach(kisumuBranchProfits){ element in
                LineMark(
                    x: .value("Date", element.date),
                    y: .value("Profits", element.profits),
                    series: .value("Kisumu Branch", "Kisumu")
                )
                .foregroundStyle(.orange)
            }
            
            RuleMark(
                y: .value("Good behaviour", 50000)
            )
            .foregroundStyle(.red)
        }
        .padding()
        .navigationTitle("Nairobi vs Kisumu Branch Profits")
    }
}

struct CompanyProfitsChart_Previews: PreviewProvider {
    static var previews: some View {
        CompanyProfitsChart()
    }
}
