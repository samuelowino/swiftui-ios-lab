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

> App Samples
>  - Document reading and writing app
>  - macOS Settings support app
>  - WatchOS Sample with Notifications Scene
>  - Responding to Scene Phase Changes 

A part of the app's user interface with a life cycle managed by the system.
Creating an app requires that you combine one or more instances that conform to the **Scene protocol** in the app's body. Swift provides several built in scenses:

* **WindowGroup** - A group that identifies a combination of multiple identical windows

* **DocumentGroup** A scene that provides support for opening, creating and saving documents

* **Settings** A scene that represents an interface for viewing and modifying app settings

* **WKNotificationScene (WatchOS 7.0+)** A scene that appears in response to receiving a set of local or remote notifiations

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

```swift
struct AppScene: Scene {
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }. onChange(of: scenePhase) { newScenePhase in
             if newScenePhase == .background {
                print("Scene phase is in background mode...")
            } else if newScenePhase == .inactive {
                print("Scene phase is in 'inactive' state...")
            } else if newScenePhase == .active {
                print("Scene phase is in 'active' state...")
            } else {
                print("Unknow scene phase state 🛑")
            }
        }
    }
}
```

- - -

## App Stucture and Behaviour

You define your app's structure declaratively.

- Create a type that conforms to the **App** protocol and use it to list the Scenes.

- To manage data models in your app, declare them using **StateObject** property wrapper.

- Make **StateObjects** available to the app's scenes and views either as direct inputs or through **Environment**.

- Whenyou want to perform some work based on **lifecycle** events use the **onChange(of: perform:)** modifier.

## StateObject

A property wrapper type that instantiates an observable object.

> Create a StateObject in a View, App or Scene by applying the **@StateObject** attribute to a property declaration and providing an initial value that conforms to the **ObservableObject** protocol.

When the published properties of an observable object changes SwiftUI updates any view that depends on those properties.

You can pass the state object via a property declaration that has the **@StateObject** attribute or you can add the object to the environment of the view hierarchy view **environmentObject()** modifier.

```swift
class SignupViewModel: ObservableObject {
    @Published var username: String = "hackerman"
    @Published var password: String = "password123"
}

struct WhatsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SignupViewModel())
        }
    }
}
```
The object can be read by any child by using **EnvironmentObject**

```swift
class SignupViewModel: ObservableObject {
    @Published var username: String = "hackerman"
    @Published var password: String = "password123"
}

@main
struct TsavoNationalParkApp: App {
    
    var body: some Scene {
        WindowGroup {
            //Pass ObservableObject to Environment here
            ContentView()
                .environmentObject(SignupViewModel())
        }
    }
}

struct SignupForm: View {
    
    @EnvironmentObject var viewModel: SignupViewModel
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title)
                .padding()
            
            Text("Already filled with values from EnvironmentObject SignupViewModel")
                .font(.caption)
                .padding()
            
            TextField("Username ", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Spacer()
        }
        .padding()
    }
}
```
- - -

```swift

class SignupViewModel: ObservableObject {
    @Published var username: String = "hackerman"
    @Published var password: String = "password123"
}

struct SignupView: View {

    @StateObject var viewModel = SignupViewModel()

    var body: some View {
        TextField("Username ", text: $viewModel.username)
        TextField("Password", $viewModel.password)
    }
}
```


![Screen Sample ](/screen-1.png)


