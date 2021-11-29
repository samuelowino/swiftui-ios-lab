## SwiftUI & iOS development concepts code lab

![Swift Logo](SwiftUI-Hero_dark@2x.png)

> Contains sample projects with documentation

### Overview

SwiftUI provides **views**, **controls** and **layout structures** for declaraing your app's user interface. The framework provides **event handlers** for delivering taps,**gestures** and other types of input to your app, and tools to manage the flow of data from your app's models down to the views and **controls** that users will see and interact with.

Define the app structure using the **App protocol**, and populate it with scenes that contain the views that make up your app's user interface.

Create your own custom views that conform to the **View protocol** , and compose them with **SwiftUI Views** for displaying **text**, **imagess**, and custom **shapes** using stack,list and more.

> You can integrate SwiftUI views with objects from *UIKit* , *AppKit* and *WatchKit* frameworks to take further advantage of platform-specific functionality.

> You can also customize **accessibility** support in SwiftUI, and **localize** your app's user interface for different languages,countries and cultural regions.

### Swift UI Navigation

You add navigation capabilities to a view by emebedding it in a NavigationView, and then nesting each row in a **NavigationView**,
and then nesting navigation view in a **NavigationLink** to set up a transition to a destination view.


### Data Binding
```
@EnvironmentObject annotation is used in views that lower down in the view hierarchy to receive data from views that are higher up.
```

```
The **environmentObject(_:) modifier can be applied so that views further down in the view hierarchy can read data objects passed down through the environment.
```

> Binding is a value and a way to change that value.

```
A binding controls the storage for a value, so you can pass data around to different views that need to read or write it.

You can use binding to plumb data throughout your app's views; bindings aren't limited to just two views.

```
### Creating State for a View

> **@State** 

```
Use the @State property wrapper to mark a value as state, declare the property as private, and give it a a default value.

@State private var showFavoritesOnly = false

@State private var defaultCountry = "Kenya"

```


