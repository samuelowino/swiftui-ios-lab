//
//  ContentView.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured

    var body: some View {
        TabView(selection: $selection) {
            
            CategoryHomeView()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
