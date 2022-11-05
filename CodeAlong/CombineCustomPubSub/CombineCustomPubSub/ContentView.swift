//
//  ContentView.swift
//  CombineCustomPubSub
//
//  Created by Samuel Owino on 05/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FruitsViewModel()
    
    var body: some View {
        VStack {
            Text("Fruits Market")
            ScrollView {
                ForEach(viewModel.fruits){ fruit in
                    Text("\(fruit.name)")
                        .bold()
                    
                    Text("\(fruit.icon)")
                        .font(.caption)
                    
                    Text("\(fruit.flavour)")
                        .font(.callout)
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.loadSomeFruits()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
