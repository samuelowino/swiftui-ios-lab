# Introducing SwiftUI
## SwiftUI Essentials

## App Protocol

App is a type that represents the structure and behaviour of an app.

Creating an app requires that one declare a structure that conforms to the App protocol. Implement the required **body computed property** to define the app's contents.

```swift
@main
struct WaterBottleApp: App {

    var body: some Scene {
        WindowGroup {
            Text("Water Bottle 🚰 App 💧")
        }
    }
}
```

## main attribute
Apply this attribute to indicate that a class, structure or enums provides the main entry point into the program/app.

> The Swift code you compile to make an executable must contain atmost one top-level entry point (main)

The **App protocol** provides a default implementation of **main()** method that the system calls to launch your app. 

## Scene Protocol

A part of the app's user interface with a life cycle managed by the system.
Creating an app requires that you combine or more instance that conform to the **Scene protocol** in the app's body. Swift provides several built in scenses:

* **WindowGroup** - A group that identifies a combination of multiple identical windows

* **DocumentGroup** A scene that provides support for opening, creating and saving documents

* **Settings** A scene that represents an interface for viewing and modifying app settings

* **WKNotificationScene (WatchOS 7.0+)** A scene that appears in response to receiving set of local or remote notifiations

> A scene acts as a container for a view hierarchy that you want to display to the user. The system decides when and how to display the scene hierarchy in the user interface in a way that's platform appropriate and dependent on the current state of the app.

## ScenePhase enum

A scene phase is an indication of a scene's current operational state. 

```swift
public enum ScenePhase : Comparable {

    /// Expect an app that enters the `background` phase to terminate.
    case background

    /// An app or custom scene in this phase contains no scene instances in the ``ScenePhase/active`` phase.
    case inactive

    /// An app or custom scene in this phase contains at least one active scene instance.
    case active

    ...
}
```

You can trigger actions when the scene phase changes.





