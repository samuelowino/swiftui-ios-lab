## Realm MongoDB Database : iOS

Realm Database solves many common mobile programming headaches:

* **Local storage**: Realm Database runs right on client devices. Access objects using the native query language for each platform.

* **Network reliability**: Realm Database is offline first.

* **Reactive UI:** Live objects always reflect the latest data stored in Realm Database. You can **subscribe** to changes, letting your UI consistently up to date.


## Realm Database
 > With the MongoDB Realm Swift SDK, you can access objects stored in a local instance of Realm Database.
 
 ## Define an Object Schema
 
 Use Swift to idiomatically define an object schema.
 
 ```
class CoffeeDrink: Object {
    @Persisted var name = ""
    @Persisted var hotOrCold: String?
    @Persisted var rating = 0
}
 ```
 
 ## Write an Object
 
 Create a new object as you would instantiate any other object. Then pass it to Realm Database inside a **write transaction**.
 
 ```
let realm = try! Realm()
 
try! realm.write {
    let shop = CoffeeShop()
    shop.name  = "Better Coffee"
    
    let drink = CoffeeDrink()
    drink.name = "Maple Latte"
    drink.rating = 7
    
    shop.drinks.append(drink)
    realm.add(shop)
}

```

## Query Realm Database 

> Query for stored objects using Swift-idiomatic queries.

```
let realm = try! Realm()

let drinks = realm.objects(CoffeeDrink.self)

let highlyRatedDrinks = drinks.where {
    $0.rating > 6
}

print("Highly-rated drinks: \(highlyRatedDrinks.count)")

let mapleORCaramelLattes = drinks.where { drink in
    drink.name = "Maple Latte" || drink.name == "Caramel Latte"
}

print("Number of maple or caramel lattes: \(mapleOrCaramelLattes.count)")

let drinkTempNotSpecified = drinks.where { drink in
    drink.hotOrCold == nil
}

print("No info about drink temp: \(drinkTempNotSpecified.count)")

```

## Update Live Objects

Update objects by updating field values on an instance of the object within a transaction.

```
let realm = try! Realm()

//Obtain the object
let mapleLatte = realm.objects(CoffeeDrink.self).where {
    $0.name == "Maple Latte"
}.first!

//Open a thread-safe transaction
try! realm.write {
    mapleLatte.name = "Maple Delight"
    
    mapleLatte.hotOrCold = "Hot"
}

```


## Realm Files
> Realm databae persists data in files saved on device storage. 
These files include:

* **realm files**, suffixed with "realm", e.g *default.realm*
> Contains object data.

* **lock files**, suffixed with "lock", e.g *default.realm.lock*
> Keep track of which version of data in realm are actively in use. This prevents realm from reclaiming storage space that is still used by a client application.


