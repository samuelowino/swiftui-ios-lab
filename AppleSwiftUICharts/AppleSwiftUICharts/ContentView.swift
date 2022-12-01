//
//  ContentView.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 01/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Text("SwiftUI Charts Practice Samples 📊📈💹")
                .multilineTextAlignment(.center)
                .font(.title)
                .bold()
                .padding()
            
            NavigationView {
                VStack {
                    NavigationLink(destination: ToyShapesChart()){
                        HStack {
                            Text("1. Toy Shapes BarChart")
                                .bold()
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
