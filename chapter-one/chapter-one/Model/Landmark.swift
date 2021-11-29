//
//  LamboDealership.swift
//  chapter-one
//
//  Created by Samuel Owino on 26/11/2021.
//

import Foundation
import SwiftUI
import CoreLocation
/**
 Adding Codable conformance makes it easier to move data between the structure and a data file.
 You'll rey on the Decodable component of the Codable protocol to read data from file.
 
 Hashable conformance defines a type that can be hashed into a Hasher to produce an integer hash value.
 
 Add a coordinates property to the structure using a nested Coordinates type that reflexts the storage in the JSON data structure.
 
var coordinates is marked as private because its only used to create a public computed property -locationCoordinate
 
 Making the Model conform to the Identifiable protocol makes it possible to omit the id property in the DealershipListView
 as long as their is a unique id for each element. The id property is used to decode it when reading the data.
 
 =================
 Binding
 =================
 A binding acts as a refence to a mutable state. When a user taps the toggle from off to on, and off a gain, the control uses the binding to udate the view's state accordingly.
 
 ==================
 Observable Objects
 ==================
 A observable object is a custom object for your data that can be bound to a view from storage in SwiftUI's environment.
 SwiftUI watches for any changes to observable objects that could affect a view, and displays the correct version of the view after a change.
 Swift UI subscribes to your observable object, and updates any views that need refreshing when the data changes.
 
 */

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    private var imageName: String
    private var coordinates: Coordinates

    var image: Image {
        Image(imageName)
    }
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude,
                               longitude: coordinates.longitude)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
