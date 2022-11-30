# Combine Framework

Customize handling of asynchronous events by combining event-processing operators.

Combine is **Generic and Type Safe**

## Key Concepts in Combine
* **Publishers**
* **Subscribers**
* **Operators**

**Publishers** 

- They are value types *(Structs)*

- Defines how values and errors are produced

- Allow for registration of a **Subscriber**

```swift
protocol Publisher {
    associatedtype Output
    associatedtype Error

    func subscribe<S: Subscriber>(_ subscriber: S) where S.Input == Output, S.Failure == Failure{
        
    } 
}
```

**Subscribers**

- They are value types *(Classes)*
- Receive values and completion

```swift
protocol Subscriber {
    associatedtype Input
    associatedtype Failure

    func receive(_ subscription: Subscription)
    func receive(_ input: Input) -> Subscribers.Demand
    func receive(completion: Subscribers.Completion<Failure>)
}
```

**Operators**

- Adopts a **Publisher** 
- Describes a behaviour for changing values
- Subcribes to a **publisher** (upstream)
- Sends results to a **subscriber** (downstream)
- They are value types

## Sample

```swift
enum NotificationData {
    case userName
}

let userNamePublisher = NotificationCenter.default.publisher(for: NotificationData.userName)

```

## NotificationCenter
A notification dispatch mechanism that allows the broadcast of information to registered observers.

```swift
class NotificationCenter: NSObject
```

Objects register with NotificationCenter to receive notifications **(NSNotification object)**, using the **addObserver()** methods. When an object adds iteself as an observer it specifies which notifications it wants to receive. Each running app has a **default notification center** and you can create custom notification centers.

## Receiving notification as Combine Publisher
### publisher(for: object)
Returns a publisher that emits events when broadcasting notifications.

```swift
class SomeObject {
    var propertyA: String
}

let someObject = SomeObject()

let publisher = NotificationCenter.default.publisher(for: someObject)
```

## Combine Subject
A combine subject is a publisher that exposes a method for  outside callers to publish elements.

```swift
protocol Subject<Output, Failure> : AnyObject, Publisher
```

You can use a Subject to inject values into a stream by using it's **send** method.

## PassthroughSubject

```swift
final class PassthroughSubject<Output, Failure> where Failure : Error
```

A subject that broadcasts elements to downstream subscribers. A PassthroughSubject drops values if there are not subscribers attached or it's current demand is zero.



## SwiftUI onReceive(:perform)

Adds an action to perform when this view detects data emitted by the publisher.

> **Parameter: publisher that the view subscribes to and action to perform when event is emitted to the subscriber.**





# References
1. https://developer.apple.com/videos/play/wwdc2019/721


