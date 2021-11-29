//
//  DealershipListView.swift
//  chapter-one
//
//  Created by Samuel Owino on 29/11/2021.
//

import SwiftUI

/**
 You can create a list that displays the elements of a collection by passing your collection of data and a closure that provides a view for each element in the collection.
 
 The list transforms each element in the collection into a child view by using the supplied closure.
 
 Lists work with identifiable data. You can make your data identifiable in one or two ways: by passing along with your data a key path to a property that uniquely identified each element, or by making your data type conform to the Identifiable protocol.
 */

struct LandmarkListView: View {
    var body: some View {
        NavigationView {
            List(lamborghiniDealers) { dealer in
                NavigationLink {
                    LandmarkDetailView(dealership: dealer)
                } label: {
                    LandmarkRow(dealership: dealer)
                }
            }
            .navigationTitle("National Parks")
            .font(.subheadline)
        }
    }
}

struct DealershipListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
