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


# References
1. https://developer.apple.com/videos/play/wwdc2019/721


