//
//  DealershipListView.swift
//  chapter-one
//
//  Created by Samuel Owino on 29/11/2021.
//

import SwiftUI
import Combine
/**
 You can create a list that displays the elements of a collection by passing your collection of data and a closure that provides a view for each element in the collection.
 
 The list transforms each element in the collection into a child view by using the supplied closure.
 
 Lists work with identifiable data. You can make your data identifiable in one or two ways: by passing along with your data a key path to a property that uniquely identified each element, or by making your data type conform to the Identifiable protocol.
 */

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
                        LandmarkDetailView(landmark: landmark)
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
