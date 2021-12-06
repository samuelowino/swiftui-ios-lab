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
@EnvironmentObject annotation is used in views that are lower 
down in the view hierarchy to receive data 
from views that are higher up.

```

```
The **environmentObject(_:) modifier can be applied so that 
views further down in the view hierarchy can 
read data objects passed down through the environment.
```

> Binding is a value and a way to change that value.

```
A binding controls the storage for a value, 
so you can pass data around to different views 
that need to read or write it.

You can use binding to plumb data throughout your 
app's views; bindings aren't limited to just two views.

```
### Creating State for a View

> **@State** 

```
Use the @State property wrapper to mark a value as state, 
declare the property as private, and give it a a default value.

@State private var showFavoritesOnly = false

@State private var defaultCountry = "Kenya"

```

### Drawing Paths and Shapes

> **GeometryReader**

You use GeometryReader to dynamically drawa, position, and size views instead of hard-coding number that might not
be correct when you reuse a view somewhere else in your app, or on a difference sized display.

**GeometryReader** dynamically reports size and position information about the parent view and the device, and updates whenever the size changes; for example, when the user rotates their iPhone.

> **ZStack**

ZStack overlays views on top of each other

```

ZStack {
   Circle().fill(.green)
   Circle().fill(.yellow).scaleEffect(0.8)
   Circle().fill(.orange).scaleEffect(0.6)
   Circle().fill(.red).scaleEffect(0.4)
}

```
> **Data**

A byte buffer in memory

The **Data** value type allows simple byte buffers to take on the behaviour of **Foundation objects**.

You can create empty or pre-populated buffers from a variety of sources and later add or remove bytes.
You can filter and sort the content, or compare against other buffers. You can manipulate subranges of bytes
and iterate over some or all of them.

Data bridges to the **NSData** class and its mutable subclass, **NSMutableData**. 
You can use these interchangeably in code that interacts with **Objective-C APIs**

> **ObservableObject**

A type of object with a *publisher* that emits before the object has changed.

By defaut an **ObservableObject** synthesizes an *objectWillChange* publisher that emits the changed value before any of its **@Published** properties changes.

```
class Contact: ObservableObject {
    @Published var name: String
    @Published var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func haveBirthday() -> Int {
        age += 1
        return age
    }
}

let john = Contact(name: "John Fisher", age: 24)

cancellable = john.objectWillChange
            .sink {_ in 
                print("\(john.age) will change")
            }

print(john.haveBirthday())
//prints "24 will change"
//prints "25"

```

> **@Published**

A type that publishes a property marked with an attribute.

```
@propertywrapper struct Published<Value>

```

Publishing a property with the @Published attribute creates a publisher of this type. You access the publisher with the $ operator.

```
class Weather {

    @Published var temperatur: Double 
    
    init(temperatur: Double) {
        self.temperature = temperature
    }
}

let weather = Weather(temperature: 20)

cancellable = weather.$temperature
    .sink() {
       print("Temperature now: \($0)") 
    }
    
weather.temperature = 25

//prints:
// Temperature now: 20.0
// Temperature now: 25.0

```

> Important!

> The @Publisher attribute is clas constrained. Use it with properties of classes, not with non-clas types like structures.


> **SwiftUI @EnvironmentObject

A property wrapper type for an observable object supplied by a parent or ancestor view.

```

@frozen @propertywrapper 
struct EnvironmentObject<ObjectType> where ObjectType : ObservableObject

```

For data that should be shared with many views in your app, SwiftUI gives you the *@EnvironmentObject property wrapper*.
This lets you share model data anywhere it's needed, while also ensuring that your views automatically stay updated when that data changes.

> Rather than creating some data in **view A**, and then passing it to **view B**, then **view C**, then **view D** beffore finally using it, you can create it in **view A** and put it into the environment so that views B, C and D will automattically have access to it.

Just like **@ObservableObject**, you never assign a value to an **@EnvironmentObject property**. Instead, it should be passed in from elsewhere, and ultimately you're probably going to want to use **@StateObject** to create it.

Unlike **@ObservableObject** we don't pass our objects into other views by hand. Instead, we send the data into a modifier called **environmentObject()**, which makes the object available in SwiftUI's environment for that view plus any others inside it.

> **@StateObject**

A property wrapper type that instantiates an observable object.

```

Declaration

@frozen @propertyWrapper 
struct StateObject<ObjectType> where ObjectType : ObservableObject

```

Create a state object in a **View**, **App** or **Scene** by applying the **@StateObject** attribute to a property declaration and providing an initial value that conforms to the **ObservableObject** protocol:

```

@StateObject var model = DataModel() 

//where DataModel() conforms to ObservableObject

class DataModel: ObservableObject {
    @Published var modelProperty: String = "some-text-like-hello"
    @Published var isEnabled: Bool = false
}

```

SwiftUI creates a new instance of the object only once for each instance of the struture that declares the object. 
When published properties of the observable object change e.g. the "modelProperty" in the example, SwiftUI updates the parts of any view that depends on those properties:

```

Text(model.modelProperty)

//Update the view any time 'modelProperty' changes

```

You can pass the state object into a property that has the **ObservableObject** attribute.

You can alternatively add the object to the environment of a view hierarchy by applying the environmentObject(_ :) modifier.

```

ContentView()
    .environmentObject(model)

```

If you create an environment object as shown in the code above, you can read the object inside ContentView or any of it's descendants using the **EnvironmentObject attribute**

```

@EnvironmentObject var model: DataModel()

```

Get a **Binding** to one of the state object's properties using the **$ operator**. 
Use a binding when you want to create a two-way connection to one of the object's properties. 
For example, you can let a Toggle control a Boolean value called isEnabled store in the model:


```

Toggle("Checkout Enabled", isOn: $model.isEnabled)

```

## Navigation

![Swift Logo](NavigationView-1_dark@2x.png)

> **NavigationView**

A view for presenting a stack of views that represents a visible path in a navigation hierarchy.

```

Declaration

struct NavigationView<Content> where Content: View

```

Use a **NavigationView** to create a *navigation-based app* in which the user can traverse a collection of views.
Users navigate to a destination view by selectiong a **NavigationLink** that you provide.

On **iPadOS** and **macOS**, the destination content appears in the text column. Other platforms push a new view onto the stack and enable removing items from the stack with platform specific controls, like a Back button or a swipe gesture.

Use the **init(content:)** initializer to create a navigation view that directly associates navigation links and their destination views:

```

NavigationView {
    List(model.notes) { note in 
        NavigationLink(note.title, destination: NoteEditor(id: note.id))
    }
    
    Text("Select a note entry")
}

```

Style a navigation view by modifying it with the **navigationViewStyle(_:)**

Use other modifiers, like **navigationTitle()**, on views presented by navigation view to customize the navigation interface for the presented view.


> **NavigationLink**

A view that controls a navigation presentation

```

Declaration

struct NavigationLink<Label, Destination> where Label: View, Destination : View

```

Users click or tap a navigation link to present a view inside a NavigationView.
You control the visual appearance of the link by providing view content in the link's trailing closure.

```

NavigationLink(destination: FolderList(id: workFolder.id)) {
    Label("Work Folder", systemImage: "folder")
}

```

For link composed only of text, you can use one of the convinience initializers that takes a string and creates a **Text** view for you.

```

NavigationLink("Work Folder", destination: FolderList(id: workFolder.id))

```

- - -

## Layouts

### VStack

> A view that arranges its children in a vertical line.

```

Declaration

@frozen struct VStack<Content> where Content: View

```

Unlike **LazyVStack**, which only renders the views when your app needs to display them onscreen, a VStack renders the views all at once, regardless of whether they are on- or offscreen.

Use the regular VStack when you have a small number of child views or don't want the delayed rendering behaviour of the "lazy" version.

```

//Example

var body: some View {
    VStack(alignment: .leading, spacing: 10) {
        ForEach(1..10, id: \.self){
            Text("Item \($0)")
        }
    }
}

```

### HStack

> A view that arranges its children in a horizontal line.

```

Declaration

@frozen struct HStack<Content> where Content: View

```

Unlike **LazyHStack**, which only renders the views when your app needs to display them onscreen, an HStack renders the views all at once, regardless of whether they are on- or offscreen. 

```

var body: some View {
    HStack(
        alignment: .top,
        spacing: 10
    ) {
        ForEach(
            1...5,
            id: \.self
        ) {
            Text("Item \($0)")
        }
    }
}

```

- - -

### ScrollView

> Scrollable view.

The scroll view displays its contents within the scrollable content region. 
ScrollView can scroll vertically, horizontally or both.

```

var body: some View {
    ScrollView {
        VStack(alignment: .leading) {
            ForEach(0..<100) {
                Text("Row \($0)")
            }
        }   
    }
}

```

- - -

## Date and Time

> **Date**

A specific point in time, independent of any calendar or time zone.

```

Declaration

struct Date

```

A date value encapsulates a single point in time, independent of any particular calendrical system or time zone. Date values represent a time interval relative to an absolute reference date.

The Date structure provides methods for comparing dates, calculating the time interval between two date and creating a new date from a time interval relative to another date.

Use date values in conjuction with **DateFormatter** instances to create localized representations of date and times and with instances to perform calendar sirthmentic.

> **DateFormatter**

A formatter that converts between dates and their textual representations.

```

Declaration

class DateFormatter: Formatter

```

Instances of DateFormatter creat string representations of **NSDate** objects, and convert textual representations of dates and times into **NSDate** objects.

### Working with User-Visible Representations of Dates and Times

When displaying a date to a user, you set the **dateStyle** and **timeStyle** properties of the dateFormatter according to your particular needs.
For example, if you want to show the month, data and year without showing the time, you would set the **dateStyle** property to **DateFormatter.Style.long** property to **DateFormatter.Style.long** .

```

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .none

let date = Date()

//US english locale (en_US)

dateFormatter.locale = Locale(indentifier: "en_US")

```

If you want to define a format that cannot be achieved using the predefines styles, you can use the **setLocalizedDateFormatFromTemplate()** to specify a localized date format fromm a template.

```

let dateFormatter = DateFormatter()
let date = Date()

dateFormatter.locale = Locale(identifier: "en_GB")
dateFormatter.setLocalizedDateFromTemplate("MMMMd")

```


> **Calendar**

A definition of the relationships between calendar units (such as eras, years and weekdays) and absolute points in time, providing calculation and comparison of date.


- - -

## CaseIterable Protocol

A type that provides a collection of all of its values

```

Declaration

protocol CaseIterable

```

When using a **CaseIterable type**, you can access a collection of all the type's cases by using the type's **allCases property**.

```

enum CompassDirection: CaseIterable {
    case north, south, east, west
}

print("There are \(CompassDirection.allCases.count) directions.")

//prints "There are 4  directions."

let caseList = CompassDirection.allCases
                                .map({case "\(case)"})
                                .joined(seperator: ", ")
                                
// caseList contains ==> "north, south, east, west"

```

You can take advantage of this compiler support when defining your own custom enumeration by declaring conformance to **CaseIterable** in the enumeration's original declaration. 


- - -

## Environment @Environment

A property wrapper that reads a value from a view's environment.

Use the **Environment property** wrapper to read a value stored in a view's environment. Indicate the value to read using an **EnvironmentValues** key path in the property declaration.
For example you an create a property that read the color scheme of the current view using the key path of the **colorScheme** property.

```

@Environment(\.colorScheme) var colorScheme: ColorScheme

or

@Environment(\.editMode) var editMode: EditMode

```

You can condition a view's content on the associated value, which you can read from the declared property's **wrapperValue**. As with any property wrapper, you access the wrapped value by directly referrring to the property:

```

if colorScheme == .dark { //checks the wrapped value
    DarkContentView()
} else {
    LightContentView()
}

```

If the value changes, SwiftUI updates any parts of your view that depends on the value. For example is user changes the Appearance settings.

> NOTE: You can use this property wrapper to *read* -- but *not set* - an environment value. SwiftUI updates some environment values automatically based on system settings and providers reasonable defaults for others. 

> You can override some of these as well as set custom environment vqlues that you define, using the **environment() view modifier**

### EnvironmentValues

A collection of environment values propagated through a view hierarchy.

SwiftUI exposes a collection of values to your app's views in an environmentValues structures.
To read a value from the structure, declare a property using the **Environement** property wrapper and specify the value's key path. 

```
//You can read the current locale

@Environment(\.locale) var locale: Locale

```

Use the property you declare to dynamically control a view's layout. SwiftUI automatically sets or updates many environment values, like **pixelLength**, **scenePhase** or **Locale**, based on device characteristics, system state or user settings.

You can set or override some values using the **environemtn()** view modifier:

```

MyView()
    .environment(\.lineLimit, 2)
    
```

The value that you set affects the environment for the view that you modify- *includingin its descendants in the view hierarchy* - but only upto the point where you apply a different environment modifier.


SwiftUI provides dedicated view modifiers for setting some values, whcih typically makes your code easier to read.
For example, rather thatn setting the **lineLimit** value directly, as in the previous example, you should instead use the **lineLimit()** modifier:

```

MyView()
    .lineLimit(2)
    
```

```

MyVeiw()
    .popover(isPresented: $isPopped) {
        PopoverContent()
            .preferredColorScheme(.dark)
    }

```

> **Custom Environment values**

Create custom environment values by defining a type that conforms to the **EnvironmentKey** protocol, and then **extending** the environment values structure with a new property. Use your key to **get** and **set** the value, and provide a dedicated modifier for clients to use when setting the value:

```

private struct MyEnvironmentKey: EnvironmentKey {
    static let defaultValue: String = "Default value"
}

extension EnvironmentValues {
    var myCustomValue: String {
        get { self[MyEnvironmentKey.self]}
        set { self[MyEnviromentKey.self] = newValue }
    }
}

extension View {
    func myCustomValue(_ myCustomValue: String) -> some View {
        environment(\.myCustomValue, myCustomValue)
    }
}

```

Clients of your value then access the value in the usual way, reading it with the **Environment** property wrapper and setting it with the **myCustomValue** view modifier.

> **WrappedValue**

The current value of the environment propery

The wrapped value property provides primary access to the value's data. However, you don't access wrapped value directed. Instead, you read the property variable created with the environment property wrapper:

```

@Environment(\.colorScheme) var colorScheme: ColorScheme

var body: some View {
    if color Scheme == .dark {
        DarkContent()
    } else {
        LightContent()
    }
}

```

- - -

## Binding - Property Wrapper

A property wrapper type that can read and write a value owned by a source of truth.

Use a binding  to create a two-way connection between a property that stores data, and a view that displays and changes the data. A binding connects a property to a source of truth stored elsewhere, instead of storing data directly. For example, a button that toggles between play and pause can create a binding to a property of its parent view using the **Binding** property wrapper.


```

struct PlayButton: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
    }
}

```

- - -

## App

A type that represents the structure and behaviour of an app.

```

Declaration

protocol App

```

Create an app by declaring a structure that conforms to the App protocol. Implement the required *body computed property* to define the app's content.

```

@main
struct MyApp: App {
    var body: some Scene {
        WindoeGroup {
           Text("Hello world!") 
        }
    }
}

```

Precede the structure's declaration with the **@main** attribute to indicate that your custom App protocol conformer provides the entry point into your app. 

The protocol provides a default implementation of the *main()* method that the system calls to launch your app. 

*You can have exactly one entry point among all of your app's files.**

Compose the app's body from instances that conform to the **Scene** protocol. 

Each scene contains the root view of a view hierachy and a has a life cycle managed by the system. 
SwiftUI provides some concrete scene types to handle common scenarios, like displaying documents or **settings**. You can also create custom scenes.

```

@main 
struct MailApp: App {
    var body: some Scene {
        WindowGroup {
                MailViewer()
        }
        
        Settings {
            SetttinsView()
        }
    }
}

```

You can declare state in your app to share across all of its scenes. For example, you can use the StateObject attribute to initialize a data model, and then provide that model on a view input as an ObservedOject or through the environment as an EnvironmentObject to scenes in the app.

```

@main
struct Mail: App {
    
    @StateObject private var model = MailModel()

    WindowGroup {
        MailViewer()
            .environmentObject(model) // Passed through the environment.
    }
    
    Settings {
        SettingsView(model: model) // Passed as an observed object.
    }   
}

```

- - -

## UILaunchScreen

The user interface to show while an app launches.

You use this key to define the launch screen that the system displays while your app launches. If you need to provide different launch screens in response to being launched by different URL schemes, use UILaunchScreens instead.

- - -

## Scene

A part of an app's user interface with a life cycle managed by the system.

```

Declaration

protocol Scene

```

You create an **App** by combinig one or more instances that conform to the Scene protocol in the app's *body*. You can use the built-in scenes that SwiftUI provides, like **WindowGroup**, along with custom scenes that you compose from other scenes. To create a custom scene, declare a type that conforms to the Scene protocol. Implement the required **body** computed property and provide the content for your custom scene.


```
struct MyScene: Scene {
    var body: some Scene {
        WindowGroup {
            MyRootView()
        }
    }
}

```

A scene acts as a container for a view hierarchy that you want to display to the user. The system decides when and how to present the view hierarchy in the user interface in a way that'splatform-appropriate and dependent on the current state of the app.

For example, for the window group shown above, the system lets the user create or remove windows that contain MyRootView on platforms like **macOS** and **iPadOS**. On other platforms, the same view hierarchy might consume the entire display when active.

On other platforms, the same view hierarchy might consume the entire display when active.

Read the **scenePhase** environment value from within a scene or one of its views to check whether a scene is active or in some oher state. You can create a property that contains the scene phase, which is one of the values in the **ScenePhase** enumeration, using the **Environment** attribute.

```
struct MyScene: Scene {
    @Environment(\.scenePhase) private var scencePhase
    
    //...
}

```

The Scene protocol provides scene modifiers, defined as protocol methods with default implementations, that you use to configure a scene. For example, you can use the **onChange(ofLperform:)** modifier to trigger an action when value changes.

```
//The following code empties the cache when all of the scenes 
//in the window group have moved to the background.

struct MyScene: Scene {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var cache = DataChache()
    
    var body: some Scene {
        WidowGroup {
            MyRootView()
        }
        .onChange(of: scenePhase) { newScenePhase in 
            if newScenePhase == .background {
                cache.empty()
            }   
        }
    }
}

```

- - -

## WindowGroup

A scene that presents a group of identically structured windows.

Use a WindowGroup as a container for a view hierarchy presented by your app. The hierarchy that you declare as the group's content serves as a template for each window that the app creates from that group.

```

@main
struct Mail: App {
    var body: some Scene  {
        WindowGroup {
            MailViewer() // Declare a view hierarchy here.
        }
    }
}

```

SwiftUI takes care of certain platform-specific behaviours. For example, on platforms that support it, like macOS and iPadOS, users can open more than one window from the group simulatenously. In macOS, users can gather open windows together in a tabbed interface. Also in macOS, window groups automatically provide commands for standard window management.

Every window created from the group maintains independent state. For example, for each new window created from the group, the system allocates new storage for any **State** or **StateObject** variables instantiated by the scene's view hierarchy.

- - -

## DocumentGroup

A scene that enables support for opening,creating and saving documents.

```

Declaration

struct DocumentGroup<Document, Content> where Content : View 

```

Use a DocumentGroup scene to tell SwiftUI what kinds of documents your app can open when you declare your app using the **App** protocol.

Initialize a document group scene by passing in the document model and a view capable of displaying the document type. The document types you supply to DocumentGroup must conform to **FileDocument** or **ReferenceFileDocument**.

SwiftUI uses the model to add document support to your app. In macOS this includes document-based menu support, including the ability to open multiple documents. In iOS this includes a document browser that can navigate to the documents stored on the file system and multiwindow support.

```

@main
struct MyApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: TextFile()) { file in
            ContentView(document: file.$document)
        }
    }
}

```

If your app only needs to display but not modify a specific document type, you can use the file viewer document group scene. You supply the file type of the document, and a view that displays the document type that you provide:


```

@main
struct MyApp: App {
    var body: some Scene {
        DocumentGroup(viewing: MyImageFormatDocument.self) { data in
            MyImageFormatViewer(image: data.document)
        }
    }
}

```

- - -

## Settings

A scene that presents an interface for viewing and modifying an app's settings.

Use a settings scene to have SwiftUI manage views with controls for your app's settings when you declare your app using the **App** protocol. When you use an **App** declaration for multiple platforms, compile the settings scene only in **macOS**.

```

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}

```

Passing a view as the argument to a settings scene in the **App** declaration causes SwiftUI to enable the app's Preferences menu item. SwiftUI manages displaying and removing the settings view the user selects the Preference item from the application menu or the equivalent keyboard shortcut:

The contents of your settings view are controls that modify bindings to **UserDefaults** values that SwiftUI manages using the **AppStorage** property wrapper:

```
struct GeneralSettingsView: View {
    @AppStorage("showPreview") private var showPreview = true
    @AppStorage("fontSize") private var fontSize = 12.0
    
    var body: some View {
        Form {
            Toggle("Show Previews", iOn: $showPreview)
            Slider(value: $fontSize, in:9...96) {
                Text("Font size (\(fontSize, specifier: "%.0f")) pts)")
            }
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}

```

You can define your settings in a single view, or you can use a **TabView** to group settings into different collections:

```

struct SettingsView: View {
    private enum Tabs: Hashable {
        case general, advanced
    }
    
    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .tag(Tabs.general)
                
            AdvancedSettingsView()
                .tabItem {
                    Label("Advanced", systemImage: "star")
                }
                .tag(Tabs.advanced)   
        }
        .padding(20)
        .frame(width: 375, height: 150)
    }
}

```

- - -

## WKNotificationScene

A scene which appears in response to receiving the specified categpry of remote or local notifications.

- - -














