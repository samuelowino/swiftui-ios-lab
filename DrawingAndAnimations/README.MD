
# Drawing and Animations | SwiftUI

# GeometryReader
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

# UnitPoint

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

# Gradients

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

- - -

# Path

> The Outline of a 2D Shape

The Path API provides the following methods:

**
1. addArch 
2. addEllipse
3. addCurve
4. addines
5. addQuadCurve
6. addRect
7. addRelativeArc
8. addRoundedRect
**

## addLine(to: CGPoint(x:,y:))

Appends a straight line segment from the current point to the specified point.

```swift
Path { path in
    path.move(to: CGPoint(x: 30, y: 10))
    path.addLine(to: CGPoint(x: 30, y: 30))
    path.addLine(to: CGPoint(x: 300, y: 30))
    path.addLine(to: CGPoint(x: 300, y: 10))
}
```

## addArch

> Adds an arch of a circle to the path, specified with a radius and angles

```swift
mutating func addArch(center: CGPoint, 
                        radius: CGFloat, 
                        startAngel: Angle, 
                        endAngle: Angle, 
                        clockwise: Bool,
                        tranform: CGAfflineTransform = .identity)
```

```swift
Path { path in
    path.move(to: CGPoint(x: 100, y: 0))
    path.addArc(center: CGPoint(x: 100, y: 0), radius: 100.0, startAngle: Angle(degrees: 110), endAngle: Angle(degrees: 0), clockwise: true)
}.fill(.angularGradient(colors: [.red,.green,.blue,.orange,.pink], center: .topLeading, startAngle: Angle(degrees:0), endAngle: Angle(degrees: 90)))
    .frame(width: 300, height: 300)
```

## addEllipse(in:transform:)
> Add an ellipse to the path

- - -

# Canvas

A view type that supports immediate mode drawing

Use a canvas to draw rich and dynamic 2D graphics inside a SwiftUI view. 
The canvas passes a **GraphicsContext** to the closure that you use to perform immediate mode drawing operations.
The canvas also passes a **CGSize** value that you can use to customize what you draw. 

```swift
Canvas { context, size in
    context.stroke(
        Path(ellipseIn: CGRect(origin: .zero, size: size)),
        with: .color(.green),
        lineWidth: 4)
    )
}
.frame(width: 400, height: 400)
.border(Color.blue)
```
- - -

# TimelineView

> A view that updates according to a schedule that you provide

```swift
struct TimelineView<Schedule, Content> where Schedule : TimelineSchedule
```

A timeline view acts as a container with no appearance of its own. Instead, it *redraws* the content it contains at scheduled points in time. 
For example, you can udate the face of an analog time once per second:

```swift
TimelineView(.periodic(from: startDate, by: 1)) { context in
    AnalogTimerView(date: context.date)
}
```

The closure that creates the content receives an input of type **TimelineView.Context** that you can use to customize the content's appearance.
The context includes the date that triggered the update.

You can define a custom schedule by creating a type that conforms to the **TimelineSchedule** protocol, or use one of the built-in schedule types:

* Use an **everyMinute** schedule to update at the beginnning of each minute.
* Use a **periodic(from:by)** schedule to update periodically with custom start time and interval between updates.
* Use an **explicit()** schedule when you need a finite number, or irregular set of updates.

- - -

# Shape

> A 2D shape that you can use when drawing a view

Shapes without an explicit fill or stroke get a default fill based on the foreground color.

You can define shapes in terms of an implicit frame of reference, such as the natural size of the view taht contains it.
Alternatively, you can define shapes in terms of absolute coordinates.

## Defining a Shape's Path

**1. func path(in: CGRect) -> Path**

Describes this shape as a path within a rectangular frame of reference.

```swift
func path(in rect: CGRect) -> Path
```

** Return value **

> A path that describes this shape

** Parameters

> The frame of reference for describing this shape.

**2. func trim(from:to)**

> Trims this shape by a fraction amount based on its representation as a path.

```swift
func trim(from startFraction: CGFloat = 0, to endFraction: CGFloat = 1) -> some Shape
```

A shape built by capturing a portiong of this shape's path.


## Transforming a Shape

> Applies an **affine tranformation** to this shape.

```swift
func tranform(_ tranform: CGAffineTransform) -> TranformedShape<Self>
```

Returns a transformed shape based on tis matrix values.

** CGAffinTranform **

An affine tranformation matrix for use in drawing 2D graphics

An affine tranformation matrix is used to rotate,scale, translate or skew the objects you draw in a graphics context

https://en.wikipedia.org/wiki/Affine_transformation

Affine tranformations are represented by a 3 by 3 matrix.

> x' = ax + cy + tx
> y' = bx + dy + ty

```swift
let circleShape: Shape = Circle()
circleShape.path(in: CGRect(x: 1, y: 1, width: 100, height: 100))
    .trim(from: 0.0, to: 0.7)
    .transform(CGAffineTransform(rotationAngle: 12))
``` 















