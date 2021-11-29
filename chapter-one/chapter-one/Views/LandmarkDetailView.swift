//
//  DealershipDetailView.swift
//  chapter-one
//
//  Created by Samuel Owino on 29/11/2021.
//

import SwiftUI
import MapKit

struct LandmarkDetailView: View {
    
    var dealership:Landmark
    
    var body: some View {
        ScrollView {
            
            NationalParkMapView(coordinate: dealership.locationCoordinates)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            ParkCircleImageView(image: dealership.image)
                .offset(y: -230)
                .padding(.bottom, -230)
            
            VStack {
                VStack(alignment: .leading) {
                    Text(dealership.name)
                        .textCase(.none)
                        .foregroundColor(.blue)
                        .font(.title)
                    
                    HStack {
                        Text(dealership.state)
                            .font(.subheadline)
                        Spacer()
                        Text(dealership.park)
                            .font(.subheadline)
                    }
                    
                    Text("About \(dealership.name)")
                        .font(.title2)
                    
                    Text(dealership.description)
                }
                .padding()
                Spacer()
            }
        }
        .navigationTitle(dealership.name)
        .navigationBarTitleDisplayMode(.inline)
    }
       
}

struct DealershipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(dealership: lamborghiniDealers[0])
    }
}
