# Swift Charts

Swift charts library enables you to construct and customize charts on every apple platforms. Swift charts is a SwiftUI framework that allows you to transform data into informative visualizations.

![Swift UI Charts](../../FrameworkOverview@2x.png)

You can create a variety of charts such as **Line Charts, bar charts and scatter plots** as shown above.

You can create a dynamic experience by adding animations to your charts.

## Initialize a chart view and create marks
> Create a **Chart view** that serves as a container for the data.

```swift
import SwiftUI
import Charts

struct BarChartView: View {

    var body: some View {
        Chart {
            //Add marks here
        }
    }
}
```

Inside the **Chart {}** specify the graphical marks that represent the data. You can populate it with a variety of marks such as **BarMark, PointMark or LineMark** that plot your data.

```swift
//ToyShapesChartView.swift

import SwiftUI
import Charts

struct BarChartView: View {

    var body: some View {
        Chart {
            ForEach(data){ shape in
                BarMark(
                    x: PlottableValue.value(xAxisLabel, shape.type),
                    y: PlottableValue.value(yAxisLabel, shape.count)
                )
            }
                
        }
    }
}


//ToyShapes.swift

struct ToyShape: Identifiable {
    var id = UUID()
    var type: String
    var count: Double
}

var data: [ToyShape] = [
    ToyShape(type: "Cube", count: 5),
    ToyShape(type: "Sphere", count: 3),
    ToyShape(type: "Triangle", count: 4),
    ToyShape(type: "Rectangle", count: 7),
]
```

<img src="../../toycharts-sample-screenshot.png" height="400">

# Customize your chart

You can customize the chart to include custom colors by adding **chartForegroundStyleScale() modifier**

``` swift
Chart(seriesData) { series in
        ForEach(series.sales){ element in
            BarMark(
                x: .value("Day", element.weekday, unit: .day),
                y: .value("Sales", element.sales)
            )
            .foregroundStyle(by: .value("City", series.city))
        }
    }
    .chartForegroundStyleScale([
        "Capertino": .orange, "San Fransisco": .green
    ])
```

<img src="../../custom_chart_colors.png" height="400">


- - -

# Chart

A swiftUI view that displays a chart

```swift
struct Chart<Content> where Content: ChartContent
```

To create a chart, instantiate a **Chart** with **marks** that display the properties of your data.

```swift
var body: some View {
    Chart {
        LineMark(...)
    }
}

var body: some View {
    Chart {
        BarMark(...)
    }
}

var body: some View {
    Chart {
        PointMark(...)
    }
}
```

## Controlling data series on a chart

You can compose more sophisticated chart marks by providing more than one series of marks to the chart.

```swift
//CompanyProfits.swift

struct CompanyProfits: Identifiable {
    var date: Date
    var profits: Double
    var branchname: String
    var id = UUID()
}

let nairobiBranchProfits: [CompanyProfits] = [
    .init(date: date(2022, 11, 1), profits: 10_000, branchname: "Nairobi"),
    .init(date: date(2022, 11, 2), profits: 11_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 3), profits: 10_500 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 4), profits: 5_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 5), profits: 16_300 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 6), profits: 18_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 7), profits: 18_700 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 8), profits: 20_500 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 9), profits: 19_600 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 10), profits: 21_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 11), profits: 22_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 12), profits: 18_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 13), profits: 60_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 14), profits: 30_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 15), profits: 60_000 ,branchname: "Nairobi"),
    .init(date: date(2022, 11, 16), profits: 70_000 ,branchname: "Nairobi"),
]

let kisumuBranchProfits: [CompanyProfits] = [
    .init(date: date(2022, 11, 1), profits: 10_000, branchname: "Kisumu"),
    .init(date: date(2022, 11, 2), profits: 10_300 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 3), profits: 10_400 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 4), profits: 9_800 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 5), profits: 10_900 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 6), profits: 11_000 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 7), profits: 10_900 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 8), profits: 19_500 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 9), profits: 15_600 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 10), profits: 18_000 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 11), profits: 17_000 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 12), profits: 17_0800 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 13), profits: 10_000 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 14), profits: 16_800 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 15), profits: 20_000 ,branchname: "Kisumu"),
    .init(date: date(2022, 11, 16), profits: 40_000 ,branchname: "Kisumu"),
]


//CompanyProfitsChart.swift

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

```

<img src="../../company_profits.png">

You indicate which series a LineMark belongs to by specifying it's **series** input parameter.

Use a **RuleMark** to produce a horizontal line segment that displays a constant threshold value across the width of the chart.

- - -

# ChartContent

A type that represents the type of content you draw on a chart.

```swift
protocol ChartContent
```

You build a chart by adding instances that conform to the **ChartContent protocol** to the chart's content closure.

```swift
Chart {
    ChartContent()
    
    ChartContent()
    
    ChartContent()

    ...
}
```

