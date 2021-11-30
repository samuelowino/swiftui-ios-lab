//
//  NationalParkMapView.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI
import MapKit

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
