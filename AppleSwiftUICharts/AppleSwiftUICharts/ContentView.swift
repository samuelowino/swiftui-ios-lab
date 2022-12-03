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
                            Text("Toy Shapes BarChart")
                                .bold()
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .font(.title2)
                    .padding()
                    
                    NavigationLink(destination: FoodTruckSingleBarChart()){
                        HStack {
                            Text("Food Truck Single BarChart")
                                .bold()
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .font(.title2)
                    .padding()
                    
                    NavigationLink(destination: WeeklySalesBarChart()){
                        HStack {
                            Text("Weekly Sales BarChart")
                                .bold()
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .font(.title2)
                    .padding()
                    
                    NavigationLink(destination: CompanyProfitsChart()){
                        HStack {
                            Text("Company Profits BarChart")
                                .bold()
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .font(.title2)
                    .padding()
                    
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
