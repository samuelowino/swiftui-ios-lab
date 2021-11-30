//
//  LandmarkDetail.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData:ModelData
    
    var landmark:Landmark
    
    var landmarkIndex:Int {
        modelData.landmarks.firstIndex(where: {data in data.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            
            NationalParkMapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            ParkCircleImageView(image: landmark.image)
                .offset(y: -230)
                .padding(.bottom, -230)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .textCase(.none)
                        .foregroundColor(.blue)
                        .font(.title)
                    
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.state)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.park)
                        .font(.subheadline)
                }
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
       
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
