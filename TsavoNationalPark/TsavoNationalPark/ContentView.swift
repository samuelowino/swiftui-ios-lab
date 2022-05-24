//
//  ContentView.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 24/05/2022.
//

import SwiftUI

struct ContentView: View {
        
    @State var value: Int = 1
    
    let step: Int = 1
    let range = 1...60
    
    var body: some View {
        Stepper(value: $value, in: range , step: step){
            Text("Minutes \(value)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
