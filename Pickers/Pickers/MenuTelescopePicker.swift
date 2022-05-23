//
//  MenuTelescopePicker.swift
//  Pickers
//
//  Created by Samuel Owino on 23/05/2022.
//

import SwiftUI

struct MenuTelescopePicker: View {
    
    @State var selectedTelescope: String = "Select a telescope"
    
    var body: some View {
        VStack {
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
                .pickerStyle(MenuPickerStyle())
                .font(.headline)
            }
            
            Spacer()

        }
    }
}

struct MenuTelescopePicker_Previews: PreviewProvider {
    static var previews: some View {
        MenuTelescopePicker()
    }
}
