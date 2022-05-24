# Tsavo National Park App
> Simple app for learning/practicing some SwiftUI concepts.

# Lesson 1: SwiftUI App Life Cycle
Xcode offers two options for app life cycle when you open a new Xcode project:

1. **UIKit AppDelegate**
2. **SwiftUI**

## <b>SwiftUI</b>
Projects created with SwiftUI option generate an AppNameApp.swift root file.
This file becomes the app's **main entry point**.

This file contains a struct that conforms to **App** protocol

```swift
@main
struct TsavoNationalParkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

ContentView is also added to the main **Window**.
**@main** just above the struct declaration tells the system that this is the **main entry point in the app**.

### <u>SwiftUI WindowGroup</u>

A *scene* that represents a group of identical structured windows.

```swift
struct WindowGroup<Content> where Content : View
```

WindowGroup is used to create a view hierarchy for the app. The hierarchy that you declare for the view's contents serves as template for each window that the view displays.

SwiftUI takes care of platform specific behaviours, for example on macOS and iPadOS, users can open more than one window from the group simulatenously. In macOS users can gather multiple windows together into a **tabbed interface**.

Every window created from the group maintains **independent state**. For example, you cannot share **State** or **StateObjects** between windows.

### <u>@main</u>

**main()** initializes and runs the application.

If you preceded your app's **App Protocol conformer** with the **@main** attribute, the system calls the conformer's main() to launch the app in a system appropriate way.

```swift
@main
struct TsavoNationalParkApp: App {
    //window group - scene enclosed
}
```

### <u>Scene</u>

A scene is a part of the operating system with a lifecycle managed by the system.

You create an **App** by combining one or more instances that *conform* to the **Scene Protocol** in the apps's body. 
You can use inbuilt scenes such as **WindowGroup** or compose custom scenes from other scenes.

>Create custom scenes by creating a struct that conforms to the scene protocol

```swift
struct PlayerSettingScene: Scene {
    var body: some Scene {
        WindowGroup{
            PlayerSettingsContentView()
        }
    }
}
```

A scene acts as a container for a viwe hierarchy that you want to display to the user. The system descides when and how to display the scene to the user in a way that is **platform appropriate**.

You can check whether a scene is active or in some other state by reading the **scenePhase** environment value.

```swift
struct PlayerProfileScene: Scene {

    @Environemnt(\.scenePhase) private var scenePhase 

    var bodu: some Scene {
        WindowGroup {
            PlayerProfileContentView()
        }
    }
}
```

The scene protocol provides **scene modifiers**, <u>*defined as protocol methods with default implementation*</u>, that you use to configure the scene

```swift
@main
struct PlayerProfileScene: Scene {
    
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase){ newScenePhase in
            if newScenePhase == ScenePhase.background {
                //empty cache
                //perform some network calls
            }
        }
    }
}

```

>Next: ScenePhase, Environment Presentation Mode
