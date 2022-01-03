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






