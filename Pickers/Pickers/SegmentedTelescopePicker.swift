//
//  RadioTelescopePicker.swift
//  Pickers
//
//  Created by Samuel Owino on 23/05/2022.
//

import SwiftUI

struct SegmentedTelescopePicker: View {
    
    @State var selectedTelescope: String = "X-ray telescopes"
    
    var body: some View {
        VStack {
            VStack {
                Text("Telescope Types:")
                    .font(.title)
                
                Picker("Telescopes", selection: $selectedTelescope){
                    Text("X-ray Telescopes")
                        .tag("X-ray telescopes")
                    Text("Ultraviolet telescopes")
                        .tag("Ultraviolet telescopes")
                }
                .pickerStyle(SegmentedPickerStyle())
                .font(.headline)
            }
            
            if selectedTelescope == "X-ray telescopes" {
                Image("x-ray-telescope")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
            } else {
                Image("ultraviolet-telescope")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
            }
            
            Spacer()
        }
        .background(selectedTelescope == "X-ray telescopes" ? Color.purple : Color.green)
    }
}

struct RadioTelescopePicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedTelescopePicker()
    }
}
