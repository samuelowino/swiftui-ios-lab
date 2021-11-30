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




