//
//  ContentView.swift
//  chapter-one
//
//  Created by Samuel Owino on 26/11/2021.
//

import SwiftUI

/**
 This is a Swift view files
 By default swift view files declare two structures.
 The first structure conforms to the View protocol and describes the views's content layout.
 The second structure declares a preview for that view.

 COMBINGING VIEWS USING STACKS
 
 When creating a SwiftUI view, you describe its content layout, and behaviour in the view's body property;
 however, the body property only returns one single view.
 You can combine and embede multiple views in stacks,which group views together horizontally, vertically or back-to-front.
 
 */

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            CarDealersMapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CarBrandImageView()
                .offset(y: -230)
                .padding(.bottom, -230)
            
            VStack(alignment: .leading) {
                Text("Lamborghini HQ")
                    .textCase(.none)
                    .foregroundColor(.blue)
                    .font(.title)
                
                HStack {
                    Text("Lamborghini Global Head Quaters")
                        .font(.subheadline)
                    Spacer()
                    Text("Main Dealership")
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
    }
}

//Preiview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
