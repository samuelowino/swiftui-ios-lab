//
//  CategoryHomeView.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI

struct CategoryHomeView: View {
    
    @EnvironmentObject var modelData:ModelData
    @State private var showProfile: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                
                modelData.features[0]
                    .image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
            
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showProfile.toggle()
                } label: {
                    Label("Toolbar", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showProfile){
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHomeView()
            .environmentObject(ModelData())
    }
}
