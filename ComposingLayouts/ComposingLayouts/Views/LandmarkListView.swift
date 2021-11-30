//
//  LandmarkListView.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI
import Combine

struct LandmarkListView: View {
    
    @EnvironmentObject var modelData:ModelData
    @State private var isShowFavoritesOnly: Bool = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter  { landmark in
            (!isShowFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            
            List {
                Toggle(isOn: $isShowFavoritesOnly){
                    Text("Show favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        //Destination
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        //Item view, --> on click leads to --> destination view
                        LandmarkRow(landmark: landmark)
                    }
                    
                }
            }
            .navigationTitle("National Parks")
            .font(.subheadline)
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
            .environmentObject(ModelData())
    }
}
