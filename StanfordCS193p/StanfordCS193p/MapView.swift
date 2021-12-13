//
//  MapView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 13/12/2021.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.15, longitude: 20.4), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
