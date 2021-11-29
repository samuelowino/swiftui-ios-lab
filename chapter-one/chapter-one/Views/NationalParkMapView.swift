//
//  CarDealersMapView.swift
//  chapter-one
//
//  Created by Samuel Owino on 26/11/2021.
//

import SwiftUI

/**
 USE SWIFTUI VIEWS FROM OTHER FRAMEWORKS
 
 Creating a amp from MapKit to render a map
 Add an import statement for MapKit
 
 */

import MapKit

/**
 @State attribute
 
 You use @State attributes to establish a source of truth for data in your app that you can modifiy from more than
 one view.
 SwiftUI manages the underlying storage and automatically updates views that depend on the value.
 
 Replace the default Text view with a Map view that takes a binding to the region
 
 By prefixing a state variable with a $, you pass a binding, which is like a reference to the underlying value.
 
 When previews are in static mode, the only render native SwiftUI views. For Map view, you'll need to switch to live
 preview to see it render.
 
 */


struct NationalParkMapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    @State private var landmarkRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44.6722, longitude: 11.1183),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $landmarkRegion)
            .onAppear(perform: {
                setRegion(coordinate)
            })
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        landmarkRegion = MKCoordinateRegion(
        center: coordinate,
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct NationalParkMapView_Previews: PreviewProvider {
    static var previews: some View {
        NationalParkMapView(coordinate: CLLocationCoordinate2D(latitude: -30.00, longitude: 20.1))
    }
}
