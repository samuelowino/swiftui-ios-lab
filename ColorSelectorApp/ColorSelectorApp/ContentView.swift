//
//  ContentView.swift
//  ColorSelectorApp
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Red", destination: ColorDetailView(color: Color.red))
                
                NavigationLink("Green", destination: ColorDetailView(color: Color.green))
                
                NavigationLink("Orange", destination: ColorDetailView(color: Color.orange))
                
                NavigationLink("Blue", destination: ColorDetailView(color: Color.blue))
                
                NavigationLink("Purple", destination: ColorDetailView(color: Color.purple))
                
            }
            .navigationTitle("Color Picker App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
