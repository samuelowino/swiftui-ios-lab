//
//  ContentView.swift
//  chapter-two-b
//
//  Created by Samuel Owino on 29/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var modelData: ModelData = ModelData()
    
    var body: some View {
        HikeView(hike:modelData.hikes[0])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
