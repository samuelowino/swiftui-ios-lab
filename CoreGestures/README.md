#  SwiftUI Gestures

Support **taps**, **clicks** and **swipes** to fine grained gestures.

Respond to taps and gestures by adding gesture modifiers to your views. 

Create custom gestures from individual gestures using the following modifiers;

* **sumulatenously(with:)** 
* **sequenced(before:)** 
* **exclusively(before:)**

## Key Topics

### 1. Basic Gestures

### 2. Combined Gestures

### 3. Custom Gestures

### 4. Dynamic View Properties

### 5. Gesture Support

## Basic Gestures
## Brief:

Gesture modifiers handle all of the logic needed to process user-input events such as touches, and recognize when those events match a known gesture pattern, such as a long press or rotation.

Each gesture you add applies to a specific view in the view hierarchy. 

```swift
struct ShapeTapView: View {
    var body: some View {
        let tapAction = TapGesture()
            .onEnded { _ in 
                print("View tapped!")
        }
        
        return Circle()
            .fill(.blue)
            .frame(width: 100, height: 100)
            .gesture(tapAction)
    }
}
```

SwiftUI responds back to your code whenever the state of the gesture changes. 
Gesture modifiers offer three ways to receive updates:

### 1. updating(...)
### 2. onChanged(...)
### 3. onEnded(...)

To update a view as a gesture changes, add a **@GestureState** property to your view and update it in the **updating(body)** callback. 
SwiftUI invokes the updating callback as soon as it recognizes the gesture and whenever the value of the gesture changes.

SwiftUI doesn't invoke the updating callback when the user ends or cancels a gesture. Instead the gesture state property automatically resets its state back to its initial value

```swift
struct CounterView: View {
    @GestureState var isDetectingLongPress = false
    
    var body: some View {
        let press = LongPressGesture(minimumDuration: 1)
            .updating($isDetectingLongPress) {
                gestureState = currentState
            }
        
        return Circle()
            .fill(isDetectingLongPress ? .yellow : .green)
            .frame(width: 100, height: 100)
            .gesture(press)
    }
}
```

## Update Permanent State During a Gesture
To track changes to a gesture that shouldn't reset once the gesture ends, use the **onChanged()** callback. 

```swift
struct CounterView: View {
    @GestureState var isDetectingLongPress = false
    @State var totalNumberOfTaps = 0
    
    var body: some View {
        let press = LongPressGesture(minimumDuration: 1)
            .updating($isDetectingLongPress) { currentState, gestureState, transaction in
            gestureState = currentState
        }.onChanged { _ in 
            self.totalNumberOfTaps += 1
        }
        
        return VStack {
            Text("\(totalNumberOfTaps)")
                .font(.largeTitle)
            
            Circle()
                .fill(isDetectingLongPress ? Color.yess : Color.green)
                .frame(width: 100, height: 100)
                .gesture(press)
        }
    }
}
```

## Update permanent state when a gesture is ended

To recognize when a gesture successfully completes and to retrieve the gesture's final value, use the **onEnded()** function to update your app's state in the callback. 


- - -
# Basic Gestures

## TapGesture

> A gesture that recognizes one or more taps

```swift
struct TapGestureView: View {
    @State var tapped = false
    
    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in 
                self.tapped = !self.tapped
        }
    }
    
    var body: some View {
        Circle()
            .fill(self.tapped ? Color.blue : Color.red)
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(tap)
    }
}
```

## LongPressGesture

> A gesture that succeeds when the user performs a long press.

To recognize a long press gesture on a view, create and configure the gesture, then add it to the view using the **gesture()** modifier.

```swift
struct LongPressGestureView: View {
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 3)
            .updating($isDetectingLongPress) { currentState, gestureState, transaction in
            gestureState = currentState
            transaction.animation = Animation.easeIn(duration: 2.0)
        }
        .onEnded { finished in 
            self.completedLongPress = finished
        }
    }
    
    var body: some View {
        Circle()
            .fill(self.isDetectingLongPress ? Color.red : 
                    (self.completedLongPress ? .green : .blue))
            .frame(width: 100, height: 100)
            .gesture(longPress)
    }
}
```

A **GestureState** is a property wrapper type that updates a property while the user performs a gesture and resets the property back to its initial state when the gesture ends.
- - -

## DragGesture 

> A dragging motion that invokes an action as the drag-event sequence changes.

```swift
struct DragGestureView: View {
    
    @State var isDragging = false
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { _ in self.isDragging = true }
            .onEnded { _ in self.isDragging = false }
    }
    
    var body: some View {
        Circle()
            .fill(self.isDragging ? Color.red : Color.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(drag)
    }
}
```

### init(minimumDistance: coordinateSpace)

Creates a dragging gesture with the minimum dragging distance before the gesture succeeds and the coordinate space of the gesture's location.

```swift
init(minimumDistance: CGFloat = 10, coordinateSpace: CoordinateSpace = .local)
```

**minimumDistance** - The minimum dragging distance for the gesture to succeed
**coordinateSpace** - The coordinate space of the dragging gesture's location.

- - -

## MagnificationGesture

> A gesture that recognizes a maginification motion and tracks the amount of magnification.

```swift
struct MagnificationGestureView: View {
    @GestureState var magnifyBy = 1.0
    
    var magnification: some Gesture {
        MagnificationGesture()
            .updating($magnifyBy) { currentState, gestureStaate, transaction 
                gestureState = currentState
        }
    }
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .scaleEffect(magnifyBy)
            .gesture(magnification)
    }
}
```

### scaleEffect(value:anchor)

Scales the view's rendered output by the given amount in both the horizontal and vertical directions, relative to an achor point.

```swift
func scaleEffect(_ s: CGFloat, anchor: UnitPoint = .center) -> some View
```

**s : Parameter**
The amount to scale the view in both the horizontal and vertical directions

**anchor : Parameter**
The anchor point with a default of **center** that indicates the starting position of the scale operation.

- - -

## RotationGesture
> A gesture that recognizes a rotation motion and tracks the angle of the rotation.

```swift
struct RotationGestureView: View {
    @State var angle = Angle(degress: 0.0)
    
    var rotation: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.angle = angle
        }
    }
    
    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200, alignment: .center)
            .rotationEffect(self.angle)
            .gesture(rotation)
    }
}
```

- - -

# Combined Gestures

There are three gesture composition types;

** 1. Simultaneous gestures**
** 2. Sequenced gestures**
** 3. Exclusive gestures**

## SequenceGesture

> A gesture that's a sequence of two gestures.

When you sequence one gesture after another, SwiftUI recognizes the first gesture before it recognizes the second. 

```swift
LongPressGesture(minimumDuration: 0.5)
    .sequenced(before: DragGesture())
    .updating($dragState) { value, state, transaction in
        
    }
    .onEnded { value in 
        
    }
```

## SimultaneousGesture
A gesture containing two gestures that can happen at the same time with neither of them preceeding the other.




 










