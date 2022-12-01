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


