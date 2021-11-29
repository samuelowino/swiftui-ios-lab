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
 */

struct LamboDealership: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description:String
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
