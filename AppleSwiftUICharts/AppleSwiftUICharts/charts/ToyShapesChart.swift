//
//  ToyShapesChart.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 01/12/2022.
//

import SwiftUI
import Charts

struct ToyShapesChart: View {
    
    let xAxisLabel: String = "Shape Type"
    let yAxisLabel: String = "Total Count"
    
    var body: some View {
        VStack {
            Label("Toy🪁 Shapes Analysis 📊", systemImage: "")
                .font(.title)
            
            Chart {
                ForEach(data){ shape in
                    BarMark(
                        x: PlottableValue.value(xAxisLabel, shape.type),
                        y: PlottableValue.value(yAxisLabel, shape.count)
                    )
                }
                
            }
            .padding()
        }
    }
}

struct ToyShapesChart_Previews: PreviewProvider {
    static var previews: some View {
        ToyShapesChart()
    }
}
