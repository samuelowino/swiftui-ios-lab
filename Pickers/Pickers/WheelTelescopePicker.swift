//
//  WheelTelescopePicker.swift
//  Pickers
//
//  Created by Samuel Owino on 23/05/2022.
//

import SwiftUI

struct WheelTelescopePicker: View {
    
    @State var selectedTelescope: String = "Select a telescope"
    
    var body: some View {
        VStack {
            Form {
                VStack {
                    Text("Telescope Types:")
                        .font(.title)
                    
                    Picker("Telescopes", selection: $selectedTelescope){
                        Text("X-ray telescopes")
                        Text("Ultraviolet telescopes")
                        Text("Optical telescopes")
                        Text("Infrared telescopes")
                        Text("Submillimetre telescopes")
                        Text("Radio telescopes")
                    }
                    .pickerStyle(WheelPickerStyle())
                    .font(.headline)
                }
            }
            
            Spacer()
        }
    }
}

struct WheelTelescopePicker_Previews: PreviewProvider {
    static var previews: some View {
        WheelTelescopePicker()
    }
}
