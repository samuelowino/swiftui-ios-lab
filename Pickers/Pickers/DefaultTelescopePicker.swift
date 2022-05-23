//
//  DefaultTelescopePicker.swift
//  Pickers
//
//  Created by Samuel Owino on 23/05/2022.
//

import SwiftUI

struct DefaultTelescopePicker: View {
    
    @State var selectedTelescope: String = "Select a telescope"
    
    var body: some View {
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
                .pickerStyle(DefaultPickerStyle())
                .font(.headline)
                
                Spacer()

            }
        }
    }
}

struct DefaultTelescopePicker_Previews: PreviewProvider {
    static var previews: some View {
        DefaultTelescopePicker()
    }
}
