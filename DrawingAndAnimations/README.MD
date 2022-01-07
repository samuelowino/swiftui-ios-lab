
# Drawing and Animations | SwiftUI

## GeometryReader
> A container view that defines its content as a function of its own size and coordinate space.

```swift
@frozen struct GeometryReader<Content> where Content : View 
```

## xScale 
> A scaling factor that multiplies the width of a node and its children.

The xScale property scales the width of the node and all of its descendants. The scalle value affects how node's frame is calculated, its hit test area, how it is drawn, and other similar characteristics. The default value is 1.0

```swift
var xScale: CGFloat { get set }
```

## Linear Gradient

> A linear gradient.

The gradient applies the color function along an axis, as defined by its start and end points. The gradient maps the unit space point into the bounding rectangle of each filled with the gradient.

**linearGradient(gradient:startPoint:endPoint)**

```swift
static func linearGradient(_ gradient: Gradient, startPoint: UnitPoint, endPoint: UnitPoint) -> LinearGradient
```

## UnitPoint

> A dynamic data structure for representing a point in a view.

```swift
@frozen struct UnitPoint : Hashable
```

A UnitPoint is a **2D coordinate**. It's x and y values are measure from 0.0 to 1.0 and represent fractions of the parent iew.

*x-axis - moves from **leading edge** to **trailing edge** *
*y-axis - moves from **top** to **bottom** *

```swift
struct ContentView: View {
    var body: some View {
        let colorRange = [Color.orange, Color.red]
        let gradient = Gradient(Colors: colorRange)
        let linearGradient = LinearGradient(gradient: gradient,
                                            startingPoint: UnitPoint(UnitPoint.top),
                                            endingPoint: UnitPoint(UnitPoint.bottom))
        return Rectangle()
            .fill(linearGradient)
            .frame(width: 100, height: 100)
    }
}
```



