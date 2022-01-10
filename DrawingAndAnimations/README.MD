
# Drawing and Animations | SwiftUI

## GeometryReader
> A container view that defines its content as a function of its own size and coordinate space.

```swift
@frozen struct GeometryReader<Content> where Content : View 
```

> Note
You use GeometryReader to dynamically draw, position, and size views instead of hard-coding numbers that might not be correct when you reuse a view somewhere else in your app, or on a different-sized display.

GeometryReader dynamically reports size and position information about the parent view and the device, and updates whenever the size changes; for example, when the user rotates their iPhone.

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

## aspectRatio(aspectRatio:CGFloat?: contentModel)

Constrains this view's dimentions to the specified aspect ratio

A view that constrains this view's dimensions to the aspect ratio of the given size using contentMode as its scaling algorithm.

```swift
Ellipse()
    .fill(Color.green)
    .aspectRatio(0.75, contentMode: .fit)
    .frame(width: 200, height: 200)
    .border(Color(white: 0.75))
```


## trim(from:to:)
Trims this shape by a fraction amount based on its representation as a path.

A shape draw by capturing a portion of this shape's path.

```swift 
func trim(from startFraction: CGFloat = 0, to endFraction: CGFloat = 1) -> some Shape
```

## AngularGradient

An angular gradient.

An angular gradient is also known as a "conic" gradient. This gradient applies the color function as the angle changes, relative to a center point and defined start and end angles. 

if endAngle - startAngle > 2pi, the gradient only draws the last complete turn.


## RadialGradient

> A radial gradient

The gradient applies the color function as the distance from a center point, scalled to fit within the defined start and end radii. The gradient maps the unit space center point into the bounding rectangle of each shape filled with the gradient.

When using a radial gradient as a shape style, you can also use **radialGradient(colors: center:startRadius:endRadius)**.

## rotationEffect(angle:anchor)

> Rotates this view's rendered output around the specified point.

```swift
func rotationEffect(_ angle: Angle, anchor: UnitPoint = .center) -> some View
```

## scaleEffect(scaleAmount: CGFloat, anchor: UnitPoint = . center) -> some View

> Scale this view's rendered output by the given amount in both horizonal and vertical directions, relative to an anchor point.











