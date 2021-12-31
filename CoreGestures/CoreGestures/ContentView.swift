//
//  ContentView.swift
//  CoreGestures
//
//  Created by Samuel Owino on 31/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: IgnitionDriveView()){
                    Label("Single Press Drive", systemImage: "car")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
